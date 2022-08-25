import 'dart:typed_data';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'image_upload_state.dart';
part 'image_upload_cubit.freezed.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  ImageUploadCubit({
    required StoreCubit storeCubit,
    ImagePickerFacade? imagePickerFacade,
    ImageUploaderFacade? imageUploaderFacade,
    ImageUtils? imageUtils,
  })  : _storeCubit = storeCubit,
        _imagePickerFacade =
            imagePickerFacade ?? ImagePickerFacade(ImagePicker()),
        _imageUploaderFacade =
            imageUploaderFacade ?? ImageUploaderFacade(Locator.instance()),
        _imageUtils = imageUtils ?? ImageUtils(),
        super(
          ImageUploadState.initial(
            file: XFile.fromData(Uint8List.fromList([])),
            bytes: Uint8List.fromList([]),
          ),
        );

  final StoreCubit _storeCubit;
  final ImagePickerFacade _imagePickerFacade;
  final ImageUploaderFacade _imageUploaderFacade;
  final ImageUtils _imageUtils;

  Future<void> seed({required String url}) async {
    emit(_Seeding(url: url, bytes: state.bytes, file: state.file));
    final bytes = await _imageUtils.getBytesForImage(url);
    emit(_Initial(url: url, bytes: bytes, file: state.file));
  }

  Future<void> pick({ImageSource source = ImageSource.gallery}) async {
    try {
      final file = await _imagePickerFacade.pick(source: source);
      if (file != null) {
        emit(
          _Picked(
            file: file,
            url: state.url,
            bytes: state.bytes,
          ),
        );
      } else {
        emit(
          _Error(
            file: state.file,
            url: state.url,
            bytes: state.bytes,
            exception: const CustomException(message: 'Image upload failed'),
          ),
        );
      }
    } catch (err) {
      emit(
        _Error(
          file: state.file,
          url: state.url,
          bytes: state.bytes,
          exception: CustomException(message: err.toString()),
        ),
      );
    } finally {
      emit(
        _Initial(
          file: state.file,
          url: state.url,
          bytes: state.bytes,
        ),
      );
    }
  }

  Future<void> upload({required MenuItemModel item}) async {
    try {
      emit(
        _Uploading(
          file: state.file,
          url: state.url,
          bytes: state.bytes,
        ),
      );
      final storeId = _storeCubit.state.store.id!;

      final uploadedUrl = await _imageUploaderFacade.upload(
        path: 'stores/$storeId/items/${item.id}',
        file: state.file,
      );
      final bytes = await state.file.readAsBytes();

      emit(
        _Uploaded(
          file: state.file,
          url: uploadedUrl ?? '',
          bytes: bytes,
        ),
      );
    } on FirebaseException catch (err) {
      emit(
        _Error(
          file: state.file,
          url: state.url,
          bytes: state.bytes,
          exception:
              CustomException(message: err.message ?? 'Something went wrong'),
        ),
      );
    } catch (err) {
      emit(
        _Error(
          file: state.file,
          url: state.url,
          bytes: state.bytes,
          exception: CustomException(message: err.toString()),
        ),
      );
    } finally {
      emit(
        ImageUploadState.initial(
          file: state.file,
          url: state.url,
          bytes: state.bytes,
        ),
      );
    }
  }
}
