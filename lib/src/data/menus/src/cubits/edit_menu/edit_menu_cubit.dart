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
        super(_Loading(menu: MenuModel.empty()));

  final MenuRepository _menuRepository;
  final StoreCubit _storeCubit;

  Future<void> loadMenu({required MenuModel menu}) async {
    if (menu.id != null && menu.id!.isNotEmpty) {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(_Loaded(menu: menu));
    } else {
      try {
        final storeId = _storeCubit.state.store.id!;
        final newMenu = await _menuRepository.create(
          storeId: storeId,
          resource: menu.copyWith(createdAt: DateTime.now()),
        );
        emit(_Loaded(menu: newMenu));
      } on CreateMenuException catch (err) {
        emit(
          _Error(
            menu: menu,
            exception: err,
          ),
        );
      }
    }
  }

  Future<void> update(MenuModel item) async {
    emit(_Updating(menu: state.menu));

    try {
      final storeId = _storeCubit.state.store.id!;
      await _menuRepository.update(
        storeId: storeId,
        resource: item,
      );

      emit(_Success(menu: state.menu));
    } on UpdateMenuException catch (err) {
      emit(_Error(menu: state.menu, exception: err));
    }
  }
}
