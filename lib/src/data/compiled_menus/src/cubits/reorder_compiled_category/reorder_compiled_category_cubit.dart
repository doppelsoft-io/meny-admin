import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'reorder_compiled_category_state.dart';
part 'reorder_compiled_category_cubit.freezed.dart';

class ReorderCompiledCategoryCubit extends Cubit<ReorderCompiledCategoryState> {
  ReorderCompiledCategoryCubit({
    CompiledMenuRepository? compiledMenuRepository,
    StoreCacheService? storeCacheService,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(const ReorderCompiledCategoryState.initial());

  final CompiledMenuRepository _compiledMenuRepository;
  final StoreCacheService _storeCacheService;

  Future<void> reorder({
    required String menuId,
    required List<CategoryModel> categories,
  }) async {
    emit(const ReorderCompiledCategoryState.reordering());

    try {
      final storeId = await _storeCacheService.get('storeId');
      final futures = List.generate(
        categories.length,
        (index) async {
          final category = categories[index];
          return _compiledMenuRepository.updateCategory(
            storeId: storeId,
            menuId: menuId,
            category: category.copyWith(position: index),
          );
        },
      );
      await Future.wait(futures);

      emit(
        const ReorderCompiledCategoryState.success(),
      );
    } catch (err) {
      emit(
        const ReorderCompiledCategoryState.error(
          exception: Failure(message: 'Reordering failed'),
        ),
      );
    }
  }
}
