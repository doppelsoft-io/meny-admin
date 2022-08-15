import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/infrastructure/i_resources_repository.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class GetModifierGroupException extends CustomException {
  const GetModifierGroupException({String? message}) : super(message: message);
}

class CreateModifierGroupException extends CustomException {
  const CreateModifierGroupException({String? message})
      : super(message: message);
}

class UpdateModifierGroupException extends CustomException {
  const UpdateModifierGroupException({String? message})
      : super(message: message);
}

class DeleteModifierGroupException extends CustomException {
  const DeleteModifierGroupException({String? message})
      : super(message: message);
}

class ModifierGroupRepository extends IResourcesRepository<ModifierGroupModel> {
  ModifierGroupRepository({
    String? path,
    FirebaseFirestore? firebaseFirestore,
    required LoggerService loggerService,
  })  : _loggerService = loggerService,
        super(
          path: path ?? Paths.modifierGroups,
          firebaseFirestore: firebaseFirestore ?? FirebaseFirestore.instance,
        );

  final LoggerService _loggerService;

  Future<ModifierGroupModel> get({
    required String storeId,
    required String id,
  }) async {
    try {
      final snap = await firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(path)
          .doc(id)
          .get();
      return ModifierGroupModel.fromSnapshot(snap);
    } catch (err) {
      _loggerService.log('(get): ${err.toString()}');
      throw const GetModifierGroupException(message: 'Failed to retrieve menu');
    }
  }

  @override
  Stream<List<ModifierGroupModel>> getAll({
    required String storeId,
    OrderBy orderBy = const OrderBy('createdAt'),
  }) {
    return firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(path)
        .orderBy(orderBy.field, descending: orderBy.descending)
        .snapshots()
        .map(
          (doc) => doc.docs.map(ModifierGroupModel.fromSnapshot).toList(),
        );
  }

  @override
  Future<ModifierGroupModel> create({
    required String storeId,
    required ModifierGroupModel resource,
  }) async {
    try {
      final document = await firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.modifierGroups)
          .add(resource.toJson());
      final snapshot = await document.get();
      return ModifierGroupModel.fromSnapshot(snapshot);
    } catch (err) {
      _loggerService.log('(create): ${err.toString()}');
      throw const CreateModifierGroupException(
        message: 'We had an issue creating your modifier group.',
      );
    }
  }

  @override
  Future<void> update({
    required String storeId,
    required ModifierGroupModel resource,
  }) async {
    try {
      await firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.modifierGroups)
          .doc(resource.id)
          .set(
            resource.copyWith(updatedAt: DateTime.now()).toJson(),
            SetOptions(merge: true),
          );
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      throw const UpdateModifierGroupException(
        message: 'We had trouble saving your modifier group.',
      );
    }
  }

  @override
  Future<void> delete({
    required String storeId,
    required ModifierGroupModel resource,
  }) async {
    try {
      await firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.modifierGroups)
          .doc(resource.id)
          .delete();
    } catch (err) {
      _loggerService.log('(delete): ${err.toString()}');
      throw const DeleteModifierGroupException(
        message: 'There was an issue deleting your modifier group.',
      );
    }
  }
}
