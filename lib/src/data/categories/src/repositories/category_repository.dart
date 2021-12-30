import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';

class CategoryRepository extends IResourcesRepository<CategoryEntity> {
  CategoryRepository({
    required String path,
    required FirebaseFirestore firebaseFirestore,
  }) : super(
          path: path,
          firebaseFirestore: firebaseFirestore,
        );

  Future<CategoryEntity> get({required String id}) async {
    try {
      final snap = await firebaseFirestore.collection(path).doc(id).get();
      return CategoryEntity.fromSnapshot(snap);
    } catch (e) {
      throw Failure(message: 'Failed to retrieve category');
    }
  }

  @override
  Stream<List<CategoryEntity>> getAll() {
    return firebaseFirestore
        .collection(path)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((doc) =>
            doc.docs.map((snap) => CategoryEntity.fromSnapshot(snap)).toList());
  }

  @override
  Future<Either<Failure, CategoryEntity>> create({
    required CategoryEntity resource,
  }) async {
    try {
      final document =
          await firebaseFirestore.collection(path).add(resource.toJson());
      final snapshot = await document.get();
      return right(CategoryEntity.fromSnapshot(snapshot));
    } catch (e) {
      return left(Failure(
        message:
            "We had an issue creating your ${resource.toFriendlyString()}. Please try again later.",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> update({
    required CategoryEntity resource,
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
    required CategoryEntity resource,
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

  Stream<List<CategoryEntity>> getCategoriesForItem({
    required MenuItemEntity item,
  }) {
    if (item.id == null) return Stream.fromIterable([]);
    return firebaseFirestore
        .collection(path)
        .where('itemIds', arrayContains: item.id)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((doc) =>
            doc.docs.map((snap) => CategoryEntity.fromSnapshot(snap)).toList());
  }
}
