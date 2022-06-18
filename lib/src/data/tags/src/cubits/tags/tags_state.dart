part of 'tags_cubit.dart';

@freezed
class TagsState with _$TagsState {
  const factory TagsState.loading({
    @Default(<TagModel>[]) List<TagModel> tags,
  }) = _Loading;

  const factory TagsState.loaded({
    required List<TagModel> tags,
  }) = _Loaded;

  const factory TagsState.error({
    required List<TagModel> tags,
    required Exception exception,
  }) = _Error;
}
