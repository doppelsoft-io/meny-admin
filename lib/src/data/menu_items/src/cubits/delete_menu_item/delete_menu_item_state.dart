part of 'delete_menu_item_cubit.dart';

@freezed
class DeleteMenuItemState with _$DeleteMenuItemState {
  const factory DeleteMenuItemState.initial() = _Initial;
  const factory DeleteMenuItemState.deleting() = _Deleting;
  const factory DeleteMenuItemState.success() = _Success;
  const factory DeleteMenuItemState.error({
    required Exception exception,
  }) = _Error;
}
