import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/menus/menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_menu_cubit.freezed.dart';
part 'edit_menu_state.dart';

class EditMenuCubit extends Cubit<EditMenuState> {
  EditMenuCubit({
    required StoreCubit storeCubit,
    MenuRepository? menuRepository,
  })  : _storeCubit = storeCubit,
        _menuRepository = menuRepository ?? Locator.instance(),
        super(EditMenuState.loading(menu: MenuModel.empty()));

  final MenuRepository _menuRepository;
  final StoreCubit _storeCubit;

  Future<void> loadMenu({required MenuModel menu}) async {
    if (menu.id != null && menu.id!.isNotEmpty) {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(EditMenuState.loaded(menu: menu));
    } else {
      final storeId = _storeCubit.state.store.id!;
      final failureOrMenu = await _menuRepository.create(
        storeId: storeId,
        resource: menu.copyWith(createdAt: DateTime.now()),
      );
      emit(
        failureOrMenu.fold(
          (failure) => EditMenuState.error(menu: menu, exception: failure),
          (menu) => EditMenuState.loaded(menu: menu),
        ),
      );
    }
  }

  Future<void> update(MenuModel item) async {
    emit(EditMenuState.updating(menu: state.menu));

    final storeId = _storeCubit.state.store.id!;
    final failureOrUpdate = await _menuRepository.update(
      storeId: storeId,
      resource: item,
    );
    emit(
      failureOrUpdate.fold(
        (failure) => EditMenuState.error(menu: state.menu, exception: failure),
        (update) => EditMenuState.success(menu: state.menu),
      ),
    );
  }
}
