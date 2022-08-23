import 'dart:typed_data';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_core/meny_core.dart';

part 'image_upload_state.dart';
part 'image_upload_cubit.freezed.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  ImageUploadCubit({
    required StoreCubit storeCubit,
    FirebaseStorage? firebaseStorage,
    ImagePicker? imagePicker,
  })  : _storeCubit = storeCubit,
        _firebaseStorage = firebaseStorage ?? Locator.instance(),
        _imagePicker = imagePicker ?? ImagePicker(),
        super(
          ImageUploadState.initial(
            file: XFile.fromData(Uint8List.fromList([])),
          ),
        );

  final StoreCubit _storeCubit;
  final FirebaseStorage _firebaseStorage;
  final ImagePicker _imagePicker;

  void seed({required String url}) => emit(state.copyWith(url: url));

  Future<void> pick({ImageSource source = ImageSource.gallery}) async {
    try {
      final file = await _imagePicker.pickImage(source: source);
      if (file != null) {
        emit(
          ImageUploadState.picked(
            file: file,
            url: state.url,
          ),
        );
      } else {
        emit(
          ImageUploadState.error(
            file: state.file,
            url: state.url,
            exception: const CustomException(message: 'Image upload failed'),
          ),
        );
      }
    } catch (err) {
      emit(
        ImageUploadState.error(
          file: state.file,
          url: state.url,
          exception: CustomException(message: err.toString()),
        ),
      );
    } finally {
      emit(
        ImageUploadState.initial(
          file: state.file,
          url: state.url,
        ),
      );
    }
  }

  Future<void> upload({required MenuItemModel item}) async {
    try {
      emit(
        ImageUploadState.uploading(
          file: state.file,
          url: state.url,
        ),
      );
      final storageRef = _firebaseStorage.ref();
      final storeId = _storeCubit.state.store.id!;
      final menuItemRef = storageRef.child('stores/$storeId/items/${item.id}');
      final data = await state.file.readAsBytes();

      await menuItemRef.putData(data);

      final uploadedUrl = await menuItemRef.getDownloadURL();

      emit(
        ImageUploadState.uploaded(
          file: state.file,
          url: uploadedUrl,
        ),
      );
    } on FirebaseException catch (err) {
      emit(
        ImageUploadState.error(
          file: state.file,
          url: state.url,
          exception:
              CustomException(message: err.message ?? 'Something went wrong'),
        ),
      );
    } catch (err) {
      emit(
        ImageUploadState.error(
          file: state.file,
          url: state.url,
          exception: CustomException(message: err.toString()),
        ),
      );
    } finally {
      emit(
        ImageUploadState.initial(
          file: state.file,
          url: state.url,
        ),
      );
    }
  }
}
