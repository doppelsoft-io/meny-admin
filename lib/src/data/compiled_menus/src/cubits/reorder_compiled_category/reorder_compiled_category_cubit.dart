import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';

part 'reorder_compiled_category_state.dart';

class ReorderCompiledCategoryCubit extends Cubit<ReorderCompiledCategoryState> {
  final CompiledMenuRepository _compiledMenuRepository;

  ReorderCompiledCategoryCubit({
 CompiledMenuRepository? compiledMenuRepository,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        super(ReorderCompiledCategoryState.initial());

  void reorder({
    required String menuId,
    required List<CategoryModel> categories,
  }) async {
    emit(state.copyWith(status: ReorderCompiledCategoryStatus.reordering));

    try {
      final futures = List.generate(
        categories.length,
        (index) async {
          final category = categories[index];
          return await _compiledMenuRepository.updateCategory(
            menuId: menuId,
            category: category.copyWith(position: index),
          );
        },
      );
      await Future.wait(futures);

      emit(state.copyWith(
        status: ReorderCompiledCategoryStatus.success,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: ReorderCompiledCategoryStatus.error,
        failure: Failure(message: 'Reordering categories failed'),
      ));
    }
  }
}
