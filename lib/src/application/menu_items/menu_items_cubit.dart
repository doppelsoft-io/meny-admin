import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
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

  Future<void> load({required String storeId}) async {
    _authCubit.state.maybeWhen(
      authenticated: (_) {
        _load(storeId: storeId);
      },
      anonymous: (_) {
        _load(storeId: storeId);
      },
      orElse: () {},
    );
  }

  Future<void> _load({required String storeId}) async {
    await _subscription?.cancel();
    _subscription = _menuItemRepository
        .getAll(
      storeId: storeId,
    )
        .listen(
      (items) {
        emit(_Loaded(items: items));
      },
    )..onError(
        (error) {
          log(error.toString());
          emit(
            _Error(
              items: state.items,
              exception: const CustomException(
                message: 'Failed to load items',
              ),
            ),
          );
        },
      );
  }
}
