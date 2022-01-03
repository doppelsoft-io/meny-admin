import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';
import 'package:meny/src/extensions/extensions.dart';
import 'package:meny/src/services/services.dart';

class MenuItemRepository extends IResourcesRepository<MenuItemEntity> {
  final LoggerService _loggerService;
  MenuItemRepository({
    String? path,
    FirebaseFirestore? firebaseFirestore,
    required LoggerService loggerService,
  })  : _loggerService = loggerService,
        super(
          path: path ?? Paths.menuItems,
          firebaseFirestore: firebaseFirestore ?? FirebaseFirestore.instance,
        );

  Future<MenuItemEntity> get({
    required String storeId,
    required String id,
  }) async {
    try {
      final snap = await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: id)
          .get();
      return MenuItemEntity.fromSnapshot(snap);
    } catch (err) {
      _loggerService.log('(get): ${err.toString()}');
      throw Failure(message: 'Failed to retrieve item');
    }
  }

  @override
  Stream<List<MenuItemEntity>> getAll({required String storeId}) {
    return firebaseFirestore
        .menuItemEntitiesCollection(storeId: storeId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((doc) =>
            doc.docs.map((snap) => MenuItemEntity.fromSnapshot(snap)).toList());
  }

  @override
  Future<Either<Failure, MenuItemEntity>> create({
    required String storeId,
    required MenuItemEntity resource,
  }) async {
    try {
      final document = await firebaseFirestore
          .menuItemEntitiesCollection(storeId: storeId)
          .add(resource.toJson());
      final snapshot = await document.get();
      return right(MenuItemEntity.fromSnapshot(snapshot));
    } catch (err) {
      _loggerService.log('(create): ${err.toString()}');
      return left(Failure(
        message:
            "We had an issue creating your ${resource.toFriendlyString()}. Please try again later.",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> update({
    required String storeId,
    required MenuItemEntity resource,
  }) async {
    try {
      await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: resource.id!)
          .set(resource.toJson(), SetOptions(merge: true));
      return right(true);
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      return left(Failure(
        message:
            'We had trouble updating your ${resource.toFriendlyString()}. Please try again later.',
        shortMessage: 'Update failed.',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> delete({
    required String storeId,
    required MenuItemEntity resource,
  }) async {
    try {
      await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: resource.id!)
          .delete();
      return right(true);
    } catch (err) {
      _loggerService.log('(delete): ${err.toString()}');
      return left(Failure(
        message:
            'There was an issue deleting your ${resource.toFriendlyString()}. Please try again later.',
        shortMessage: 'Deleting ${resource.toFriendlyString()} failed.',
      ));
    }
  }
}
