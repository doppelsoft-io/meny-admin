import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';
import 'package:meny/src/extensions/extensions.dart';
import 'package:meny/src/services/services.dart';

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
      throw const Failure(message: 'Failed to retrieve menu');
    }
  }

  @override
  Stream<List<MenuModel>> getAll({required String storeId}) {
    return firebaseFirestore
        .menuEntitiesCollection(storeId: storeId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (doc) =>
              doc.docs.map((snap) => MenuModel.fromSnapshot(snap)).toList(),
        );
  }

  Stream<List<MenuModel>> getMenusForCategory({
    required String storeId,
    required CategoryModel category,
  }) {
    if (category.id == null) return Stream.fromIterable([]);
    return firebaseFirestore
        .menuEntitiesCollection(storeId: storeId)
        .where('categoryIds', arrayContains: category.id)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map(
          (doc) =>
              doc.docs.map((snap) => MenuModel.fromSnapshot(snap)).toList(),
        );
  }

  @override
  Future<Either<Failure, MenuModel>> create({
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
        Failure(
          message:
              'We had an issue creating your ${resource.toFriendlyString()}. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> update({
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
        Failure(
          message:
              'We had trouble updating your ${resource.toFriendlyString()}. Please try again later.',
          shortMessage: 'Update failed.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> delete({
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
        Failure(
          message:
              'There was an issue deleting your ${resource.toFriendlyString()}. Please try again later.',
          shortMessage: 'Deleting ${resource.toFriendlyString()} failed.',
        ),
      );
    }
  }
}
