part of 'edit_modifier_group_item_cubit.dart';

@freezed
class EditModifierGroupItemState with _$EditModifierGroupItemState {
  const factory EditModifierGroupItemState.initial({
    required ModifierGroupItemModel modifierGroupItem,
  }) = _Initial;

  const factory EditModifierGroupItemState.updating({
    required ModifierGroupItemModel modifierGroupItem,
  }) = _Updating;

  const factory EditModifierGroupItemState.success({
    required ModifierGroupItemModel modifierGroupItem,
  }) = _Success;

  const factory EditModifierGroupItemState.error({
    required ModifierGroupItemModel modifierGroupItem,
    required Exception exception,
  }) = _Error;
}
