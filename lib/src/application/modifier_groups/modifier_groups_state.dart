part of 'modifier_groups_cubit.dart';

@freezed
class ModifierGroupsState with _$ModifierGroupsState {
  const factory ModifierGroupsState.loading({
    @Default(<ModifierGroupModel>[]) List<ModifierGroupModel> groups,
  }) = _Loading;

  const factory ModifierGroupsState.loaded({
    required List<ModifierGroupModel> groups,
  }) = _Loaded;

  const factory ModifierGroupsState.error({
    required List<ModifierGroupModel> groups,
    required Exception exception,
  }) = _Error;
}
