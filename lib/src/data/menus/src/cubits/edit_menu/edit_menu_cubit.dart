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
        super(_Initial(menu: MenuModel.empty()));

  final MenuRepository _menuRepository;
  final StoreCubit _storeCubit;

  Future<void> loadMenu({required String id}) async {
    emit(_Loading(menu: state.menu));
    try {
      final storeId = _storeCubit.state.store.id!;
      final menu = await _menuRepository.get(
        storeId: storeId,
        id: id,
      );
      emit(_Loaded(menu: menu));
    } on GetMenuException catch (err) {
      emit(
        _Error(
          menu: state.menu,
          exception: err,
        ),
      );
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
