part of 'delete_modifier_group_cubit.dart';

@freezed
class DeleteModifierGroupState with _$DeleteModifierGroupState {
  const factory DeleteModifierGroupState.initial() = _Initial;
  const factory DeleteModifierGroupState.deleting() = _Deleting;
  const factory DeleteModifierGroupState.success() = _Success;
  const factory DeleteModifierGroupState.error({
    required Exception exception,
  }) = _Error;
}
