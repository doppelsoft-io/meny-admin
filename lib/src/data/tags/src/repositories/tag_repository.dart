import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class GetTagException extends CustomException {
  const GetTagException({String? message}) : super(message: message);
}

class CreateTagException extends CustomException {
  const CreateTagException({String? message}) : super(message: message);
}

class UpdateTagException extends CustomException {
  const UpdateTagException({String? message}) : super(message: message);
}

class DeleteTagException extends CustomException {
  const DeleteTagException({String? message}) : super(message: message);
}

class TagRepository {
  TagRepository({
    FirebaseFirestore? firebaseFirestore,
    LoggerService? loggerService,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _loggerService =
            loggerService ?? const LoggerService(prepend: 'TagRepository');

  final FirebaseFirestore _firebaseFirestore;
  final LoggerService _loggerService;

  Stream<List<TagModel>> getAll({
    required String storeId,
  }) {
    return _firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(Paths.tags)
        .snapshots()
        .map(
          (doc) => doc.docs.map(TagModel.fromSnapshot).toList(),
        );
  }

  Future<TagModel> create({
    required String storeId,
    required TagModel resource,
  }) async {
    try {
      final document = await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.tags)
          .add(resource.toJson());
      final snapshot = await document.get();
      return TagModel.fromSnapshot(snapshot);
    } catch (err) {
      _loggerService.log('(create): ${err.toString()}');
      throw const CreateTagException(
        message: 'We had an issue creating your tag. Please try again later.',
      );
    }
  }

  Future<void> update({
    required String storeId,
    required TagModel resource,
  }) async {
    try {
      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.tags)
          .doc(resource.id)
          .set(resource.toJson(), SetOptions(merge: true));
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      throw const UpdateTagException(
        message: 'We had an issue updating your tag. Please try again later.',
      );
    }
  }

  Future<void> delete({
    required String storeId,
    required TagModel resource,
  }) async {
    try {
      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.tags)
          .doc(resource.id)
          .delete();
    } catch (err) {
      _loggerService.log('(delete): ${err.toString()}');
      throw const DeleteTagException(
        message: 'We had an issue deleting your tag. Please try again later.',
      );
    }
  }
}
