import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/src/data/repositories/i_resources_repository.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
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
  })  : _loggerService = loggerService,
        super(
          path: path,
          firebaseFirestore: firebaseFirestore,
        );

  final LoggerService _loggerService;

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
  Stream<List<MenuModel>> getAll({required String storeId}) {
    return firebaseFirestore
        .menuEntitiesCollection(storeId: storeId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map(
          (doc) => doc.docs.map(MenuModel.fromSnapshot).toList(),
        );
  }

  @override
  Future<Either<CustomException, MenuModel>> create({
    required String storeId,
    required MenuModel resource,
  }) async {
    try {
      final document = await firebaseFirestore
          .menuEntitiesCollection(storeId: storeId)
          .add(resource.toJson());
      final snapshot = await document.get();
      return right(MenuModel.fromSnapshot(snapshot));
    } catch (err) {
      _loggerService.log('(create): ${err.toString()}');
      return left(
        CreateMenuException(
          message:
              'We had an issue creating your ${resource.toFriendlyString()}. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<CustomException, bool>> update({
    required String storeId,
    required MenuModel resource,
  }) async {
    try {
      await firebaseFirestore
          .menuEntitiesDocument(storeId: storeId, menuId: resource.id!)
          .set(resource.toJson(), SetOptions(merge: true));
      return right(true);
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      return left(
        UpdateMenuException(
          message:
              'We had trouble updating your ${resource.toFriendlyString()}. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<CustomException, bool>> delete({
    required String storeId,
    required MenuModel resource,
  }) async {
    try {
      await firebaseFirestore
          .menuEntitiesDocument(storeId: storeId, menuId: resource.id!)
          .delete();
      return right(true);
    } catch (err) {
      _loggerService.log('(delete): ${err.toString()}');
      return left(
        DeleteMenuException(
          message:
              'There was an issue deleting your ${resource.toFriendlyString()}. Please try again later.',
        ),
      );
    }
  }
}
