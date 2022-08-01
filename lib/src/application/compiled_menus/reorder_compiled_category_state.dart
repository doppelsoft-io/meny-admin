part of 'reorder_compiled_category_cubit.dart';

@freezed
class ReorderCompiledCategoryState with _$ReorderCompiledCategoryState {
  const factory ReorderCompiledCategoryState.initial() = _Initial;
  const factory ReorderCompiledCategoryState.reordering() = _Reordering;
  const factory ReorderCompiledCategoryState.success() = _Success;
  const factory ReorderCompiledCategoryState.error({
    required Exception exception,
  }) = _Error;
}
