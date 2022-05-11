part of 'edit_category_cubit.dart';

@freezed
class EditCategoryState with _$EditCategoryState {
  const factory EditCategoryState.loading({
    required CategoryModel category,
  }) = _Initial;

  const factory EditCategoryState.loaded({
    required CategoryModel category,
  }) = _Loaded;

  const factory EditCategoryState.updating({
    required CategoryModel category,
  }) = _Updating;

  const factory EditCategoryState.success({
    required CategoryModel category,
  }) = _Success;

  const factory EditCategoryState.error({
    required CategoryModel category,
    required Exception exception,
  }) = _Error;
}
