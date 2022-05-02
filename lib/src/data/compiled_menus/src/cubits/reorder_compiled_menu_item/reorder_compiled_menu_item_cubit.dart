import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'reorder_compiled_menu_item_state.dart';
part 'reorder_compiled_menu_item_cubit.freezed.dart';

class ReorderCompiledMenuItemCubit extends Cubit<ReorderCompiledMenuItemState> {
  ReorderCompiledMenuItemCubit({
    CompiledMenuRepository? compiledMenuRepository,
    StoreCacheService? storeCacheService,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(const ReorderCompiledMenuItemState.initial());

  final CompiledMenuRepository _compiledMenuRepository;
  final StoreCacheService _storeCacheService;

  Future<void> reorder({
    required String menuId,
    required String categoryId,
    required List<MenuItemModel> items,
  }) async {
    emit(const ReorderCompiledMenuItemState.reordering());

    try {
      final storeId = await _storeCacheService.get('storeId');
      final futures = List.generate(
        items.length,
        (index) async {
          final item = items[index];
          return _compiledMenuRepository.updateMenuItem(
            storeId: storeId,
            menuId: menuId,
            categoryId: categoryId,
            item: item.copyWith(position: index),
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
