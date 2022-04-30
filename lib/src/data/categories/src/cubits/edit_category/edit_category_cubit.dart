import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'edit_category_cubit.freezed.dart';
part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  final CategoryRepository _categoryRepository;
  final StoreCacheService _storeCacheService;

  EditCategoryCubit({
    CategoryRepository? categoryRepository,
    StoreCacheService? storeCacheService,
  })  : _categoryRepository = categoryRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(EditCategoryState.initial(category: CategoryModel.empty()));

  void loadCategory(CategoryModel category) async {
    if (category.id != null && category.id!.isNotEmpty) {
      emit(state.copyWith(category: category));
    } else {
      final storeId = await _storeCacheService.get('storeId');
      final failureOrCategory = await _categoryRepository.create(
        storeId: storeId,
        resource: category,
      );
      failureOrCategory.fold(
        (failure) => emit(EditCategoryState.error(
          category: category,
          exception: failure,
        )),
        (category) => emit(EditCategoryState.initial(category: category)),
      );
    }
  }

  void update(CategoryModel item) async {
    emit(EditCategoryState.updating(category: state.category));
    final storeId = await _storeCacheService.get('storeId');
    final failureOrUpdate = await _categoryRepository.update(
      storeId: storeId,
      resource: item,
    );
    failureOrUpdate.fold(
      (failure) => emit(EditCategoryState.error(
        category: state.category,
        exception: failure,
      )),
      (update) => emit(EditCategoryState.success(category: state.category)),
    );
  }
}
