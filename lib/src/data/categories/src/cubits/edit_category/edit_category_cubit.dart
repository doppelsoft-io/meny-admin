import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/categories/categories.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_category_cubit.freezed.dart';
part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  EditCategoryCubit({
    required StoreCubit storeCubit,
    CategoryRepository? categoryRepository,
  })  : _storeCubit = storeCubit,
        _categoryRepository = categoryRepository ?? Locator.instance(),
        super(EditCategoryState.loading(category: CategoryModel.empty()));

  final CategoryRepository _categoryRepository;
  final StoreCubit _storeCubit;

  Future<void> loadCategory(CategoryModel category) async {
    if (category.id != null && category.id!.isNotEmpty) {
      /// Needed to trigger loaded event in listener
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(EditCategoryState.loaded(category: category));
    } else {
      try {
        final storeId = _storeCubit.state.store.id!;
        await _categoryRepository.create(
          storeId: storeId,
          resource: category.copyWith(createdAt: DateTime.now()),
        );
        emit(EditCategoryState.loaded(category: category));
      } on CreateCategoryException catch (err) {
        emit(
          EditCategoryState.error(
            category: category,
            exception: err,
          ),
        );
      }
    }
  }

  Future<void> update(CategoryModel item) async {
    emit(EditCategoryState.updating(category: state.category));

    try {
      final storeId = _storeCubit.state.store.id!;

      await _categoryRepository.update(
        storeId: storeId,
        resource: item,
      );
      emit(EditCategoryState.success(category: state.category));
    } on UpdateCategoryException catch (err) {
      emit(
        EditCategoryState.error(
          category: state.category,
          exception: err,
        ),
      );
    }
  }
}
