part of 'create_category_cubit.dart';

@freezed
class CreateCategoryState with _$CreateCategoryState {
  const factory CreateCategoryState.initial({
    required CategoryModel category,
  }) = _Initial;

  const factory CreateCategoryState.creating({
    required CategoryModel category,
  }) = _Creating;

  const factory CreateCategoryState.created({
    required CategoryModel category,
  }) = _Created;

  const factory CreateCategoryState.error({
    required CategoryModel category,
    required Exception exception,
  }) = _Error;
}
