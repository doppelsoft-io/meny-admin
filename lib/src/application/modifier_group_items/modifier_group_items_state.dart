part of 'modifier_group_items_cubit.dart';

@freezed
class ModifierGroupItemsState with _$ModifierGroupItemsState {
  const factory ModifierGroupItemsState.initial({
    @Default(<MenuItemModel>[]) List<MenuItemModel> items,
    @Default(<ModifierGroupItemModel>[])
        List<ModifierGroupItemModel> modifierGroupItems,
  }) = _Initial;

  const factory ModifierGroupItemsState.adding({
    required List<MenuItemModel> items,
    required List<ModifierGroupItemModel> modifierGroupItems,
  }) = _Adding;

  const factory ModifierGroupItemsState.removing({
    required List<MenuItemModel> items,
    required List<ModifierGroupItemModel> modifierGroupItems,
  }) = _Removing;

  const factory ModifierGroupItemsState.updating({
    required List<MenuItemModel> items,
    required List<ModifierGroupItemModel> modifierGroupItems,
  }) = _Updating;

  const factory ModifierGroupItemsState.success({
    required List<MenuItemModel> items,
    required List<ModifierGroupItemModel> modifierGroupItems,
  }) = _Success;

  const factory ModifierGroupItemsState.error({
    required List<MenuItemModel> items,
    required List<ModifierGroupItemModel> modifierGroupItems,
    required Exception exception,
  }) = _Error;
}
