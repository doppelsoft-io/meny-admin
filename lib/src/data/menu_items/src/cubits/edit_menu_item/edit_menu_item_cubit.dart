import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/cubits/cubits.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'edit_menu_item_cubit.freezed.dart';
part 'edit_menu_item_state.dart';

class EditMenuItemCubit extends Cubit<EditMenuItemState> {
  final MenuItemRepository _menuItemRepository;
  final StoreCubit _storeCubit;

  EditMenuItemCubit({
    MenuItemRepository? menuItemRepository,
    required StoreCubit storeCubit,
  })  : _menuItemRepository = menuItemRepository ?? Locator.instance(),
        _storeCubit = storeCubit,
        super(EditMenuItemState.loading(item: MenuItemModel.empty()));

  Future<void> loadItem(MenuItemModel item) async {
    if (item.id != null && item.id!.isNotEmpty) {
      /// Needed to trigger loaded event in listener
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(EditMenuItemState.loaded(item: item));
    } else {
      final storeId = _storeCubit.state.store.id!;
      final failureOrItem = await _menuItemRepository.create(
        storeId: storeId,
        resource: item.copyWith(createdAt: DateTime.now()),
      );
      emit(
        failureOrItem.fold(
          (failure) => EditMenuItemState.error(item: item, exception: failure),
          (item) => EditMenuItemState.loaded(item: item),
        ),
      );
    }
  }

  Future<void> update(MenuItemModel item) async {
    emit(EditMenuItemState.updating(item: item));
    final storeId = _storeCubit.state.store.id!;
    final failureOrUpdate = await _menuItemRepository.update(
      storeId: storeId,
      resource: item,
    );
    emit(
      failureOrUpdate.fold(
        (failure) => EditMenuItemState.error(item: item, exception: failure),
        (update) => EditMenuItemState.success(item: item),
      ),
    );
  }
}
