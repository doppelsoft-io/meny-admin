part of 'menu_item_modifier_groups_cubit.dart';

@freezed
class MenuItemModifierGroupsState with _$MenuItemModifierGroupsState {
  const factory MenuItemModifierGroupsState.initial({
    @Default(<ModifierGroupModel>[]) List<ModifierGroupModel> groups,
    @Default(<MenuItemModifierGroupModel>[])
        List<MenuItemModifierGroupModel> menuItemModifierGroups,
  }) = _Initial;
  const factory MenuItemModifierGroupsState.adding({
    required List<ModifierGroupModel> groups,
    required List<MenuItemModifierGroupModel> menuItemModifierGroups,
  }) = _Adding;
  const factory MenuItemModifierGroupsState.removing({
    required List<ModifierGroupModel> groups,
    required List<MenuItemModifierGroupModel> menuItemModifierGroups,
  }) = _Removing;
  const factory MenuItemModifierGroupsState.success({
    required List<ModifierGroupModel> groups,
    required List<MenuItemModifierGroupModel> menuItemModifierGroups,
  }) = _Success;
  const factory MenuItemModifierGroupsState.error({
    required List<ModifierGroupModel> groups,
    required List<MenuItemModifierGroupModel> menuItemModifierGroups,
    required Exception exception,
  }) = _Error;
}
