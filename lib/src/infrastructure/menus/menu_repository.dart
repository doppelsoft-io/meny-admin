import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/infrastructure/i_resources_repository.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class GetMenuException extends CustomException {
  const GetMenuException({String? message}) : super(message: message);
}

class CreateMenuException extends CustomException {
  const CreateMenuException({String? message}) : super(message: message);
}

class UpdateMenuException extends CustomException {
  const UpdateMenuException({String? message}) : super(message: message);
}

class DeleteMenuException extends CustomException {
  const DeleteMenuException({String? message}) : super(message: message);
}

class MenuRepository extends IResourcesRepository<MenuModel> {
  MenuRepository({
    required String path,
    required FirebaseFirestore firebaseFirestore,
    required LoggerService loggerService,
    UuidService? uuidService,
  })  : _loggerService = loggerService,
        _uuidService = uuidService ?? Locator.instance(),
        super(
          path: path,
          firebaseFirestore: firebaseFirestore,
        );

  static const String namespace = 'menus';

  final LoggerService _loggerService;

  final UuidService _uuidService;

  Future<MenuModel> get({
    required String storeId,
    required String id,
  }) async {
    try {
      final snap = await firebaseFirestore
          .menuEntitiesDocument(storeId: storeId, menuId: id)
          .get();
      return MenuModel.fromSnapshot(snap);
    } catch (err) {
      _loggerService.log('(get): ${err.toString()}');
      throw const GetMenuException(message: 'Failed to retrieve menu');
    }
  }

  @override
  Stream<List<MenuModel>> getAll({
    required String storeId,
    required OrderBy orderBy,
  }) {
    return firebaseFirestore
        .menuEntitiesCollection(storeId: storeId)
        .orderBy(orderBy.field, descending: orderBy.descending)
        .snapshots()
        .map(
          (doc) => doc.docs.map(MenuModel.fromSnapshot).toList(),
        );
  }

  @override
  Future<MenuModel> create({
    required String storeId,
    required MenuModel resource,
  }) async {
    try {
      final document = firebaseFirestore
          .menuEntitiesCollection(storeId: storeId)
          .doc(_uuidService.uuid);
      await document.set(resource.toJson());
      final snapshot = await document.get();
      return MenuModel.fromSnapshot(snapshot);
    } catch (err) {
      _loggerService.log('(create): ${err.toString()}');
      throw const CreateMenuException(
        message: 'We had an issue creating your menu.',
      );
    }
  }

  @override
  Future<void> update({
    required String storeId,
    required MenuModel resource,
  }) async {
    try {
      await firebaseFirestore
          .menuEntitiesDocument(storeId: storeId, menuId: resource.id!)
          .set(resource.toJson(), SetOptions(merge: true));
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      throw const UpdateMenuException(
        message: 'We had trouble saving your menu.',
      );
    }
  }

  @override
  Future<void> delete({
    required String storeId,
    required MenuModel resource,
  }) async {
    try {
      await firebaseFirestore
          .menuEntitiesDocument(storeId: storeId, menuId: resource.id!)
          .delete();
    } catch (err) {
      _loggerService.log('(delete): ${err.toString()}');
      throw const DeleteMenuException(
        message: 'There was an issue deleting your menu.',
      );
    }
  }
}
