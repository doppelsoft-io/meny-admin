import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/stores/cubits/cubits.dart';

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
      final storeId = _storeCubit.state.store.id!;

      final failureOrCategory = await _categoryRepository.create(
        storeId: storeId,
        resource: category,
      );

      emit(
        failureOrCategory.fold(
          (failure) => EditCategoryState.error(
            category: category,
            exception: failure,
          ),
          (category) => EditCategoryState.loaded(category: category),
        ),
      );
    }
  }

  Future<void> update(CategoryModel item) async {
    emit(EditCategoryState.updating(category: state.category));

    final storeId = _storeCubit.state.store.id!;

    final failureOrUpdate = await _categoryRepository.update(
      storeId: storeId,
      resource: item,
    );

    emit(
      failureOrUpdate.fold(
        (failure) => EditCategoryState.error(
          category: state.category,
          exception: failure,
        ),
        (update) => EditCategoryState.success(category: state.category),
      ),
    );
  }
}
