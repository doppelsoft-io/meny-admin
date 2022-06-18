part of 'delete_tag_cubit.dart';

@freezed
class DeleteTagState with _$DeleteTagState {
  const factory DeleteTagState.initial() = _Initial;
  const factory DeleteTagState.deleting() = _Deleting;
  const factory DeleteTagState.success() = _Success;
  const factory DeleteTagState.error({
    required Exception exception,
  }) = _Error;
}
