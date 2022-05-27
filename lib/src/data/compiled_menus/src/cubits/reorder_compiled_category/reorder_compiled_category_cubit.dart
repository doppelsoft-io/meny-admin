import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/core/failures.dart';
import 'package:meny_admin/src/data/menu_categories/menu_categories.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_core/meny_core.dart';

part 'reorder_compiled_category_state.dart';
part 'reorder_compiled_category_cubit.freezed.dart';

class ReorderCompiledCategoryCubit extends Cubit<ReorderCompiledCategoryState> {
  ReorderCompiledCategoryCubit({
    MenuCategoryRepository? menuCategoryRepository,
    required StoreCubit storeCubit,
  })  : _storeCubit = storeCubit,
        _menuCategoryRepository = menuCategoryRepository ?? Locator.instance(),
        super(const ReorderCompiledCategoryState.initial());

  final StoreCubit _storeCubit;
  final MenuCategoryRepository _menuCategoryRepository;

  Future<void> reorder({
    required String menuId,
    required List<CategoryModel> categories,
  }) async {
    emit(const ReorderCompiledCategoryState.reordering());

    try {
      final storeId = _storeCubit.state.store.id!;
      final futures = List.generate(
        categories.length,
        (index) async {
          final category = categories[index];
          final menuCategory = await _menuCategoryRepository.get(
            storeId: storeId,
            menuId: menuId,
            categoryId: category.id!,
          );
          return _menuCategoryRepository.update(
            storeId: storeId,
            model: menuCategory.copyWith(position: index),
          );
        },
      );
      await Future.wait(futures);

      emit(const ReorderCompiledCategoryState.success());
    } catch (err) {
      emit(
        const ReorderCompiledCategoryState.error(
          exception: Failure(message: 'Reordering failed'),
        ),
      );
    }
  }
}
