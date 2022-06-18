part of 'edit_tag_cubit.dart';

@freezed
class EditTagState with _$EditTagState {
  const factory EditTagState.loading({
    required TagModel tag,
  }) = _Loading;

  const factory EditTagState.loaded({
    required TagModel tag,
  }) = _Loaded;

  const factory EditTagState.updating({
    required TagModel tag,
  }) = _Updating;

  const factory EditTagState.success({
    required TagModel tag,
  }) = _Success;

  const factory EditTagState.error({
    required TagModel tag,
    required Exception exception,
  }) = _Error;
}
