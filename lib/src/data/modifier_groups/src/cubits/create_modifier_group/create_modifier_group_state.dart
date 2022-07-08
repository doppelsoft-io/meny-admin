part of 'create_modifier_group_cubit.dart';

@freezed
class CreateModifierGroupState with _$CreateModifierGroupState {
  const factory CreateModifierGroupState.initial({
    required ModifierGroupModel group,
  }) = _Initial;

  const factory CreateModifierGroupState.creating({
    required ModifierGroupModel group,
  }) = _Creating;

  const factory CreateModifierGroupState.created({
    required ModifierGroupModel group,
  }) = _Created;

  const factory CreateModifierGroupState.error({
    required ModifierGroupModel group,
    required Exception exception,
  }) = _Error;
}
