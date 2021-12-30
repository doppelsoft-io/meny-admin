import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';

part 'reorder_compiled_menu_item_state.dart';

class ReorderCompiledMenuItemCubit extends Cubit<ReorderCompiledMenuItemState> {
  final CompiledMenuRepository _compiledMenuRepository;
  ReorderCompiledMenuItemCubit({
    CompiledMenuRepository? compiledMenuRepository,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        super(ReorderCompiledMenuItemState.initial());

  void reorder({
    required String menuId,
    required String categoryId,
    required List<MenuItemModel> items,
  }) async {
    emit(state.copyWith(status: ReorderCompiledMenuItemStatus.reordering));

    try {
      final futures = List.generate(
        items.length,
        (index) async {
          final item = items[index];
          return await _compiledMenuRepository.updateMenuItem(
            menuId: menuId,
            categoryId: categoryId,
            item: item.copyWith(position: index),
          );
        },
      );
      await Future.wait(futures);
      emit(state.copyWith(
        status: ReorderCompiledMenuItemStatus.success,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: ReorderCompiledMenuItemStatus.error,
        failure: Failure(message: 'Reordering items failed'),
      ));
    }
  }
}
