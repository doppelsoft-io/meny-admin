import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/enums/enums.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';

part 'edit_menu_item_state.dart';

class EditMenuItemCubit extends Cubit<EditMenuItemState> {
  final MenuItemRepository _menuItemRepository;

  EditMenuItemCubit({
    required MenuItemRepository menuItemRepository,
  })  : _menuItemRepository = menuItemRepository,
        super(EditMenuItemState.initial());

  void loadItem(MenuItemEntity item) async {
    if (item.id != null && item.id!.isNotEmpty) {
      emit(state.copyWith(item: item));
    } else {
      final failureOrItem = await _menuItemRepository.create(resource: item);
      failureOrItem.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (item) => emit(
          state.copyWith(item: item, failure: null),
        ),
      );
    }
  }

  void update(MenuItemEntity item) async {
    emit(state.copyWith(status: EditResourceStatus.updating));
    final failureOrUpdate = await _menuItemRepository.update(resource: item);
    failureOrUpdate.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        status: EditResourceStatus.error,
      )),
      (update) => emit(state.copyWith(
        status: EditResourceStatus.success,
        failure: null,
      )),
    );
  }
}
