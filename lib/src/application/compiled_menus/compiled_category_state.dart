part of 'compiled_category_cubit.dart';

@freezed
class CompiledCategoryState with _$CompiledCategoryState {
  factory CompiledCategoryState.initial({
    @Default(<CategoryModel>[]) List<CategoryModel> categories,
  }) = _Initial;

  factory CompiledCategoryState.loading({
    required List<CategoryModel> categories,
  }) = _Loading;

  factory CompiledCategoryState.success({
    required List<CategoryModel> categories,
  }) = _Success;

  factory CompiledCategoryState.error({
    required List<CategoryModel> categories,
    required Exception exception,
  }) = _Error;
}
