part of 'image_upload_cubit.dart';

@freezed
class ImageUploadState with _$ImageUploadState {
  const factory ImageUploadState.initial({
    required XFile file,
    @Default('') String url,
    required Uint8List bytes,
  }) = _Initial;

  const factory ImageUploadState.seeding({
    required XFile file,
    required String url,
    required Uint8List bytes,
  }) = _Seeding;

  const factory ImageUploadState.picked({
    required XFile file,
    required String url,
    required Uint8List bytes,
  }) = _Picked;

  const factory ImageUploadState.uploading({
    required XFile file,
    required String url,
    required Uint8List bytes,
  }) = _Uploading;

  const factory ImageUploadState.uploaded({
    required XFile file,
    required String url,
    required Uint8List bytes,
  }) = _Uploaded;

  const factory ImageUploadState.error({
    required XFile file,
    required String url,
    required Exception exception,
    required Uint8List bytes,
  }) = _Error;
}
