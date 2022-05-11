part of 'delete_category_cubit.dart';

@freezed
class DeleteCategoryState with _$DeleteCategoryState {
  const factory DeleteCategoryState.initial() = _Initial;
  const factory DeleteCategoryState.deleting() = _Deleting;
  const factory DeleteCategoryState.success() = _Success;
  const factory DeleteCategoryState.error({
    required Exception exception,
  }) = _Error;
}
