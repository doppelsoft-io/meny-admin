import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';
import 'package:meny/src/extensions/extensions.dart';
import 'package:meny/src/services/services.dart';

class CategoryRepository extends IResourcesRepository<CategoryModel> {
  final LoggerService _loggerService;
  CategoryRepository({
    required String path,
    required FirebaseFirestore firebaseFirestore,
    required LoggerService loggerService,
  })  : _loggerService = loggerService,
        super(
          path: path,
          firebaseFirestore: firebaseFirestore,
        );

  Future<CategoryModel> get({
    required String storeId,
    required String id,
  }) async {
    try {
      final snap = await firebaseFirestore
          .categoryEntitiesDocument(storeId: storeId, categoryId: id)
          .get();
      return CategoryModel.fromSnapshot(snap);
    } catch (err) {
      _loggerService.log('(get): ${err.toString()}');
      throw const Failure(message: 'Failed to retrieve category');
    }
  }

  @override
  Stream<List<CategoryModel>> getAll({required String storeId}) {
    return firebaseFirestore
        .categoryEntitiesCollection(storeId: storeId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((doc) =>
            doc.docs.map((snap) => CategoryModel.fromSnapshot(snap)).toList(),);
  }

  @override
  Future<Either<Failure, CategoryModel>> create({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      final document = await firebaseFirestore
          .categoryEntitiesCollection(storeId: storeId)
          .add(resource.toJson());
      final snapshot = await document.get();
      return right(CategoryModel.fromSnapshot(snapshot));
    } catch (err) {
      _loggerService.log('(create): ${err.toString()}');
      return left(Failure(
        message:
            'We had an issue creating your ${resource.toFriendlyString()}. Please try again later.',
      ),);
    }
  }

  @override
  Future<Either<Failure, bool>> update({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      await firebaseFirestore
          .categoryEntitiesDocument(storeId: storeId, categoryId: resource.id!)
          .set(resource.toJson(), SetOptions(merge: true));
      return right(true);
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      return left(Failure(
        message:
            'We had trouble updating your ${resource.toFriendlyString()}. Please try again later.',
        shortMessage: 'Update failed.',
      ),);
    }
  }

  @override
  Future<Either<Failure, bool>> delete({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      await firebaseFirestore
          .categoryEntitiesDocument(storeId: storeId, categoryId: resource.id!)
          .delete();
      return right(true);
    } catch (err) {
      _loggerService.log('(delete): ${err.toString()}');
      return left(Failure(
        message:
            'There was an issue deleting your ${resource.toFriendlyString()}. Please try again later.',
        shortMessage: 'Deleting ${resource.toFriendlyString()} failed.',
      ),);
    }
  }

  Stream<List<CategoryModel>> getCategoriesForItem({
    required String storeId,
    required MenuItemModel item,
  }) {
    if (item.id == null) return Stream.fromIterable([]);
    return firebaseFirestore
        .categoryEntitiesCollection(storeId: storeId)
        .where('itemIds', arrayContains: item.id)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((doc) =>
            doc.docs.map((snap) => CategoryModel.fromSnapshot(snap)).toList(),);
  }
}
