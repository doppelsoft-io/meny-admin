import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';

class MenuItemRepository extends IResourcesRepository<MenuItemEntity> {
  MenuItemRepository({
    String? path,
    FirebaseFirestore? firebaseFirestore,
  }) : super(
          path: path ?? Paths.menuItems,
          firebaseFirestore: firebaseFirestore ?? FirebaseFirestore.instance,
        );

  Future<MenuItemEntity> get({required String id}) async {
    try {
      final snap = await firebaseFirestore.collection(path).doc(id).get();
      return MenuItemEntity.fromSnapshot(snap);
    } catch (e) {
      throw Failure(message: 'Failed to retrieve item');
    }
  }

  @override
  Stream<List<MenuItemEntity>> getAll() {
    return firebaseFirestore
        .collection(path)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((doc) =>
            doc.docs.map((snap) => MenuItemEntity.fromSnapshot(snap)).toList());
  }

  @override
  Future<Either<Failure, MenuItemEntity>> create({
    required MenuItemEntity resource,
  }) async {
    try {
      final document =
          await firebaseFirestore.collection(path).add(resource.toJson());
      final snapshot = await document.get();
      return right(MenuItemEntity.fromSnapshot(snapshot));
    } catch (e) {
      return left(Failure(
        message:
            "We had an issue creating your ${resource.toFriendlyString()}. Please try again later.",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> update({
    required MenuItemEntity resource,
  }) async {
    try {
      await firebaseFirestore
          .collection(path)
          .doc(resource.id)
          .set(resource.toJson(), SetOptions(merge: true));
      return right(true);
    } catch (e) {
      return left(Failure(
        message:
            'We had trouble updating your ${resource.toFriendlyString()}. Please try again later.',
        shortMessage: 'Update failed.',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> delete({
    required MenuItemEntity resource,
  }) async {
    try {
      await firebaseFirestore.collection(path).doc(resource.id).delete();
      return right(true);
    } catch (e) {
      return left(Failure(
        message:
            'There was an issue deleting your ${resource.toFriendlyString()}. Please try again later.',
        shortMessage: 'Deleting ${resource.toFriendlyString()} failed.',
      ));
    }
  }
}
