import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/data/core/failures.dart';
import 'package:meny_admin/src/data/repositories/i_resources_repository.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenuItemRepository extends IResourcesRepository<MenuItemModel> {
  MenuItemRepository({
    String? path,
    FirebaseFirestore? firebaseFirestore,
    required LoggerService loggerService,
  })  : _loggerService = loggerService,
        super(
          path: path ?? Paths.menuItems,
          firebaseFirestore: firebaseFirestore ?? FirebaseFirestore.instance,
        );

  final LoggerService _loggerService;

  Future<MenuItemModel> get({
    required String storeId,
    required String id,
  }) async {
    try {
      final snap = await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: id)
          .get();
      return MenuItemModel.fromSnapshot(snap);
    } catch (err) {
      _loggerService.log('(get): ${err.toString()}');
      throw const Failure(message: 'Failed to retrieve item');
    }
  }

  @override
  Stream<List<MenuItemModel>> getAll({required String storeId}) {
    return firebaseFirestore
        .menuItemEntitiesCollection(storeId: storeId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map(
          (doc) => doc.docs.map(MenuItemModel.fromSnapshot).toList(),
        );
  }

  @override
  Future<Either<Failure, MenuItemModel>> create({
    required String storeId,
    required MenuItemModel resource,
  }) async {
    try {
      final document = await firebaseFirestore
          .menuItemEntitiesCollection(storeId: storeId)
          .add(resource.toJson());
      final snapshot = await document.get();
      return right(MenuItemModel.fromSnapshot(snapshot));
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
    required MenuItemModel resource,
  }) async {
    try {
      await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: resource.id!)
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
    required MenuItemModel resource,
  }) async {
    try {
      await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: resource.id!)
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
