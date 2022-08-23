import 'dart:async';
import 'dart:developer';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'menu_items_state.dart';
part 'menu_items_cubit.freezed.dart';

class MenuItemsCubit extends Cubit<MenuItemsState> {
  MenuItemsCubit({
    required AuthCubit authCubit,
    MenuItemRepository? menuItemRepository,
  })  : _authCubit = authCubit,
        _menuItemRepository = menuItemRepository ?? Locator.instance(),
        super(const _Loading());

  final AuthCubit _authCubit;
  final MenuItemRepository _menuItemRepository;

  StreamSubscription? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({
    required String storeId,
    OrderBy orderBy = const OrderBy(
      'createdAt',
      sortColumnIndex: 3,
    ),
  }) async {
    emit(
      _Loading(
        items: state.items,
        orderBy: orderBy,
      ),
    );
    _authCubit.state.maybeWhen(
      initial: (_) {},
      unauthenticated: (_) {},
      orElse: () {
        _load(
          storeId: storeId,
          orderBy: orderBy,
        );
      },
    );
  }

  Future<void> _load({
    required String storeId,
    required OrderBy orderBy,
  }) async {
    await _subscription?.cancel();
    _subscription = _menuItemRepository
        .getAll(
      storeId: storeId,
      orderBy: orderBy,
    )
        .listen(
      (items) {
        emit(
          _Loaded(
            items: items,
            orderBy: state.orderBy,
          ),
        );
      },
    )..onError(
        (error) {
          log(error.toString());
          emit(
            _Error(
              items: state.items,
              orderBy: state.orderBy,
              exception: const CustomException(
                message: 'Failed to load items',
              ),
            ),
          );
        },
      );
  }

  // void sort([int Function(MenuItemModel, MenuItemModel)? compare]) {
  //   emit(_Loaded(items: List<MenuItemModel>.from(state.items)..sort(compare)));
  // }
}
