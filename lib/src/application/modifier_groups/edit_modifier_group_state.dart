part of 'edit_modifier_group_cubit.dart';

@freezed
class EditModifierGroupState with _$EditModifierGroupState {
  const factory EditModifierGroupState.loading({
    required ModifierGroupModel group,
  }) = _Loading;

  const factory EditModifierGroupState.loaded({
    required ModifierGroupModel group,
  }) = _Loaded;

  const factory EditModifierGroupState.updating({
    required ModifierGroupModel group,
  }) = _Updating;

  const factory EditModifierGroupState.success({
    required ModifierGroupModel group,
  }) = _Success;

  const factory EditModifierGroupState.error({
    required ModifierGroupModel group,
    required Exception exception,
  }) = _Error;
}
