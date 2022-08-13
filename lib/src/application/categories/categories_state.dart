part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.loading({
    @Default(<CategoryModel>[]) List<CategoryModel> categories,
  }) = _Loading;

  const factory CategoriesState.loaded({
    required List<CategoryModel> categories,
  }) = _Loaded;

  const factory CategoriesState.error({
    required List<CategoryModel> categories,
    required Exception exception,
  }) = _Error;
}
