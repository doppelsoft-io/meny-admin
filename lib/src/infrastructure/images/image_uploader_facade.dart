import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_core/meny_core.dart';

class ImageUploaderFacade implements IImageUploaderFacade {
  ImageUploaderFacade(this._firebaseStorage);

  final FirebaseStorage _firebaseStorage;

  @override
  Future<String?> upload({
    String? path,
    XFile? file,
  }) async {
    assert(path != null && path.isNotEmpty, 'Path cannot be null or empty');
    assert(file != null, 'File cannot be null');
    final storageRef = _firebaseStorage.ref();
    final ref = storageRef.child(path!);
    final bytes = await file!.readAsBytes();
    await ref.putData(bytes);
    final uploadedUrl = await ref.getDownloadURL();
    return uploadedUrl;
  }
}
