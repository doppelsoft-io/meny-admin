part of 'modifier_groups_cubit.dart';

@freezed
class ModifierGroupsState with _$ModifierGroupsState {
  const factory ModifierGroupsState.loading({
    @Default(<ModifierGroupModel>[]) List<ModifierGroupModel> groups,
    @Default(OrderBy()) OrderBy orderBy,
  }) = _Loading;

  const factory ModifierGroupsState.loaded({
    required List<ModifierGroupModel> groups,
    required OrderBy orderBy,
  }) = _Loaded;

  const factory ModifierGroupsState.error({
    required List<ModifierGroupModel> groups,
    required OrderBy orderBy,
    required Exception exception,
  }) = _Error;
}
