part of 'image_upload_cubit.dart';

@freezed
class ImageUploadState with _$ImageUploadState {
  const factory ImageUploadState.initial({
    required XFile file,
    @Default('') String url,
  }) = _Initial;

  const factory ImageUploadState.picked({
    required XFile file,
    required String url,
  }) = _Picked;

  const factory ImageUploadState.uploading({
    required XFile file,
    required String url,
  }) = _Uploading;

  const factory ImageUploadState.uploaded({
    required XFile file,
    required String url,
  }) = _Uploaded;

  const factory ImageUploadState.error({
    required XFile file,
    required String url,
    required Exception exception,
  }) = _Error;
}
