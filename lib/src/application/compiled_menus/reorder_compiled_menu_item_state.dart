part of 'reorder_compiled_menu_item_cubit.dart';

@freezed
class ReorderCompiledMenuItemState with _$ReorderCompiledMenuItemState {
  const factory ReorderCompiledMenuItemState.initial() = _Initial;
  const factory ReorderCompiledMenuItemState.reordering() = _Reordering;
  const factory ReorderCompiledMenuItemState.success() = _Success;
  const factory ReorderCompiledMenuItemState.error({
    required Exception exception,
  }) = _Error;
}
