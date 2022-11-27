import 'dart:async';
import 'dart:developer';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'menus_state.dart';
part 'menus_cubit.freezed.dart';

class MenusCubit extends Cubit<MenusState> {
  MenusCubit({
    required AuthCubit authCubit,
    MenuRepository? menuRepository,
  })  : _authCubit = authCubit,
        _menuRepository = menuRepository ?? Locator.instance(),
        super(const _Loading());
  StreamSubscription? _subscription;

  final AuthCubit _authCubit;
  final MenuRepository _menuRepository;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> _load({
    required String storeId,
    required OrderBy orderBy,
  }) async {
    _subscription = _menuRepository
        .getAll(
          storeId: storeId,
          orderBy: orderBy,
        )
        .listen(
          (menus) => emit(
            _Loaded(
              menus: menus,
              orderBy: state.orderBy,
            ),
          ),
        )..onError((error) {
        log(error.toString());
        emit(
          _Error(
            menus: state.menus,
            orderBy: state.orderBy,
            exception: const CustomException(
              message: 'Failed to load menus',
            ),
          ),
        );
      });
  }

  Future<void> load({
    required String storeId,
    OrderBy orderBy = const OrderBy(sortColumnIndex: 1),
  }) async {
    await _subscription?.cancel();
    emit(
      _Loading(
        menus: state.menus,
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
}
