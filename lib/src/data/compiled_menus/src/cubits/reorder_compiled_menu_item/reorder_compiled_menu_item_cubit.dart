import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'reorder_compiled_menu_item_state.dart';

class ReorderCompiledMenuItemCubit extends Cubit<ReorderCompiledMenuItemState> {
  final CompiledMenuRepository _compiledMenuRepository;
  final StoreCacheService _storeCacheService;

  ReorderCompiledMenuItemCubit({
    CompiledMenuRepository? compiledMenuRepository,
    StoreCacheService? storeCacheService,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(ReorderCompiledMenuItemState.initial());

  void reorder({
    required String menuId,
    required String categoryId,
    required List<MenuItemModel> items,
  }) async {
    emit(state.copyWith(status: ReorderCompiledMenuItemStatus.reordering));

    try {
      final storeId = await _storeCacheService.get('storeId');
      final futures = List.generate(
        items.length,
        (index) async {
          final item = items[index];
          return await _compiledMenuRepository.updateMenuItem(
            storeId: storeId,
            menuId: menuId,
            categoryId: categoryId,
            item: item.copyWith(position: index),
          );
        },
      );
      await Future.wait(futures);
      emit(state.copyWith(
        status: ReorderCompiledMenuItemStatus.success,
      ),);
    } catch (err) {
      emit(state.copyWith(
        status: ReorderCompiledMenuItemStatus.error,
        failure: const Failure(message: 'Reordering items failed'),
      ),);
    }
  }
}
