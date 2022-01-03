import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/enums/enums.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'edit_menu_item_state.dart';

class EditMenuItemCubit extends Cubit<EditMenuItemState> {
  final MenuItemRepository _menuItemRepository;
  final StoreCacheService _storeCacheService;

  EditMenuItemCubit({
    MenuItemRepository? menuItemRepository,
    StoreCacheService? storeCacheService,
  })  : _menuItemRepository = menuItemRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(EditMenuItemState.initial());

  void loadItem(MenuItemEntity item) async {
    if (item.id != null && item.id!.isNotEmpty) {
      emit(state.copyWith(item: item));
    } else {
      final storeId = await _storeCacheService.get('storeId');
      final failureOrItem = await _menuItemRepository.create(
        storeId: storeId,
        resource: item,
      );
      failureOrItem.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (item) => emit(state.copyWith(
          item: item,
          failure: null,
        )),
      );
    }
  }

  void update(MenuItemEntity item) async {
    emit(state.copyWith(status: EditResourceStatus.updating));
    final storeId = await _storeCacheService.get('storeId');
    final failureOrUpdate = await _menuItemRepository.update(
      storeId: storeId,
      resource: item,
    );
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
