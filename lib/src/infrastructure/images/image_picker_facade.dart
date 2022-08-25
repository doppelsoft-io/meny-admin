import 'package:doppelsoft_core/doppelsoft_core.dart';

class ImagePickerFacade implements IImagePickerFacade {
  ImagePickerFacade(this._imagePicker);

  final ImagePicker _imagePicker;

  @override
  Future<XFile?> pick({ImageSource source = ImageSource.gallery}) async {
    final file = await _imagePicker.pickImage(source: source);
    return file;
  }
}
