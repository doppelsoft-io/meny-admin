import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/stores/stores.dart';

part 'reorder_compiled_category_state.dart';
part 'reorder_compiled_category_cubit.freezed.dart';

class ReorderCompiledCategoryCubit extends Cubit<ReorderCompiledCategoryState> {
  ReorderCompiledCategoryCubit({
    CategoryRepository? categoryRepository,
    required StoreCubit storeCubit,
  })  : _storeCubit = storeCubit,
        _categoryRepository = categoryRepository ?? Locator.instance(),
        super(const ReorderCompiledCategoryState.initial());

  final StoreCubit _storeCubit;
  final CategoryRepository _categoryRepository;

  Future<void> reorder({
    required List<CategoryModel> categories,
  }) async {
    emit(const ReorderCompiledCategoryState.reordering());

    try {
      final storeId = _storeCubit.state.store.id!;
      final futures = List.generate(
        categories.length,
        (index) async {
          final category = categories[index];
          return _categoryRepository.update(
            storeId: storeId,
            resource: category.copyWith(position: index),
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
