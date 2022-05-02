part of 'edit_menu_item_cubit.dart';

@freezed
class EditMenuItemState with _$EditMenuItemState {
  const factory EditMenuItemState.loading({
    required MenuItemModel item,
  }) = _Loading;

  const factory EditMenuItemState.loaded({
    required MenuItemModel item,
  }) = _Loaded;

  const factory EditMenuItemState.updating({
    required MenuItemModel item,
  }) = _Updating;

  const factory EditMenuItemState.success({
    required MenuItemModel item,
  }) = _Success;

  const factory EditMenuItemState.error({
    required MenuItemModel item,
    required Exception exception,
  }) = _Error;
}
