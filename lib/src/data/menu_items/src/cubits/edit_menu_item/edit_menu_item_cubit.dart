import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/menu_items/menu_items.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_menu_item_state.dart';
part 'edit_menu_item_cubit.freezed.dart';

class EditMenuItemCubit extends Cubit<EditMenuItemState> {
  EditMenuItemCubit({
    MenuItemRepository? menuItemRepository,
    required StoreCubit storeCubit,
  })  : _menuItemRepository = menuItemRepository ?? Locator.instance(),
        _storeCubit = storeCubit,
        super(_Loading(item: MenuItemModel.empty()));

  final MenuItemRepository _menuItemRepository;
  final StoreCubit _storeCubit;

  Future<void> loadItem(MenuItemModel item) async {
    if (item.id != null && item.id!.isNotEmpty) {
      /// Needed to trigger loaded event in listener
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(_Loaded(item: item));
    } else {
      try {
        final storeId = _storeCubit.state.store.id!;
        final newItem = await _menuItemRepository.create(
          storeId: storeId,
          resource: item.copyWith(createdAt: DateTime.now()),
        );
        emit(_Loaded(item: newItem));
      } on CreateMenuItemException catch (err) {
        emit(
          _Error(
            item: item,
            exception: err,
          ),
        );
      }
    }
  }

  Future<void> update(MenuItemModel item, {bool save = true}) async {
    emit(_Updating(item: item));

    try {
      final storeId = _storeCubit.state.store.id!;
      if (save) {
        await _menuItemRepository.update(
          storeId: storeId,
          resource: item.copyWith(updatedAt: DateTime.now()),
        );
        emit(_Success(item: item));
      } else {
        emit(_Loaded(item: item));
      }
    } on UpdateMenuItemException catch (err) {
      emit(
        _Error(
          item: item,
          exception: err,
        ),
      );
    }
  }
}
