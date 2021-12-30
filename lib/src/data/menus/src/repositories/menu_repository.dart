import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';

class MenuRepository extends IResourcesRepository<MenuEntity> {
  MenuRepository({
    required String path,
    required FirebaseFirestore firebaseFirestore,
  }) : super(
          path: path,
          firebaseFirestore: firebaseFirestore,
        );

  Future<MenuEntity> get({required String id}) async {
    try {
      final snap = await firebaseFirestore.collection(path).doc(id).get();
      return MenuEntity.fromSnapshot(snap);
    } catch (e) {
      throw Failure(message: 'Failed to retrieve menu');
    }
  }

  @override
  Stream<List<MenuEntity>> getAll() {
    return firebaseFirestore
        .collection(path)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((doc) =>
            doc.docs.map((snap) => MenuEntity.fromSnapshot(snap)).toList());
  }

  Stream<List<MenuEntity>> getMenusForCategory({
    required CategoryEntity category,
  }) {
    if (category.id == null) return Stream.fromIterable([]);
    return firebaseFirestore
        .collection(path)
        .where('categoryIds', arrayContains: category.id)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((doc) =>
            doc.docs.map((snap) => MenuEntity.fromSnapshot(snap)).toList());
  }

  @override
  Future<Either<Failure, MenuEntity>> create({
    required MenuEntity resource,
  }) async {
    try {
      final document =
          await firebaseFirestore.collection(path).add(resource.toJson());
      final snapshot = await document.get();
      return right(MenuEntity.fromSnapshot(snapshot));
    } catch (e) {
      return left(Failure(
        message:
            "We had an issue creating your ${resource.toFriendlyString()}. Please try again later.",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> update({required MenuEntity resource}) async {
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
  Future<Either<Failure, bool>> delete({required MenuEntity resource}) async {
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
