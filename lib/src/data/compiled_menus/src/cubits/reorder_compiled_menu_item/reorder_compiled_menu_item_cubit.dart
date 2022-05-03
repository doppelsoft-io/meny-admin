import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/stores.dart';

part 'reorder_compiled_menu_item_state.dart';
part 'reorder_compiled_menu_item_cubit.freezed.dart';

class ReorderCompiledMenuItemCubit extends Cubit<ReorderCompiledMenuItemState> {
  ReorderCompiledMenuItemCubit({
    required StoreCubit storeCubit,
    MenuItemRepository? menuItemRepository,
  })  : _storeCubit = storeCubit,
        _menuItemRepository = menuItemRepository ?? Locator.instance(),
        super(const ReorderCompiledMenuItemState.initial());

  final StoreCubit _storeCubit;
  final MenuItemRepository _menuItemRepository;

  Future<void> reorder({
    required List<MenuItemModel> items,
  }) async {
    emit(const ReorderCompiledMenuItemState.reordering());

    try {
      final storeId = _storeCubit.state.store.id!;
      final futures = List.generate(
        items.length,
        (index) async {
          final item = items[index];
          return _menuItemRepository.update(
            storeId: storeId,
            resource: item.copyWith(position: index),
          );
        },
      );
      await Future.wait(futures);
      emit(
        const ReorderCompiledMenuItemState.success(),
      );
    } catch (err) {
      emit(
        const ReorderCompiledMenuItemState.error(
          exception: Failure(message: 'Reordering items failed.'),
        ),
      );
    }
  }
}
