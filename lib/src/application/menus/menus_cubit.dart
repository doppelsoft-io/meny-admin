import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'menus_state.dart';
part 'menus_cubit.freezed.dart';

class MenusCubit extends Cubit<MenusState> {
  MenusCubit({
    MenuRepository? menuRepository,
  })  : _menuRepository = menuRepository ?? Locator.instance(),
        super(const _Loading());
  StreamSubscription? _subscription;

  final MenuRepository _menuRepository;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({required String storeId}) async {
    await _subscription?.cancel();
    _subscription = _menuRepository
        .getAll(
      storeId: storeId,
    )
        .listen((menus) {
      emit(_Loaded(menus: menus));
    })
      ..onError(
        (error) {
          emit(
            _Error(
              menus: state.menus,
              exception: const CustomException(
                message: 'Failed to load menus',
              ),
            ),
          );
        },
      );
  }
}
