import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/enums/enums.dart';

part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  final CategoryRepository _categoryRepository;

  EditCategoryCubit({
    CategoryRepository? categoryRepository,
  })  : _categoryRepository = categoryRepository ?? Locator.instance(),
        super(EditCategoryState.initial());

  void loadCategory(CategoryEntity category) async {
    if (category.id != null && category.id!.isNotEmpty) {
      emit(state.copyWith(category: category));
    } else {
      final failureOrCategory =
          await _categoryRepository.create(resource: category);
      failureOrCategory.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (category) => emit(state.copyWith(category: category, failure: null)),
      );
    }
  }

  void update(CategoryEntity item) async {
    emit(state.copyWith(status: EditResourceStatus.updating));
    final failureOrUpdate = await _categoryRepository.update(resource: item);
    failureOrUpdate.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        status: EditResourceStatus.error,
      )),
      (update) => emit(state.copyWith(
        status: EditResourceStatus.success,
        failure: null,
      )),
    );
  }
}
