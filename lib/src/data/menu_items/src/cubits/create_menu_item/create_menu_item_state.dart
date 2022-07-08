part of 'create_menu_item_cubit.dart';

@freezed
class CreateMenuItemState with _$CreateMenuItemState {
  const factory CreateMenuItemState.initial({
    required MenuItemModel item,
  }) = _Initial;

  const factory CreateMenuItemState.creating({
    required MenuItemModel item,
  }) = _Creating;

  const factory CreateMenuItemState.created({
    required MenuItemModel item,
  }) = _Created;

  const factory CreateMenuItemState.error({
    required MenuItemModel item,
    required Exception exception,
  }) = _Error;
}
