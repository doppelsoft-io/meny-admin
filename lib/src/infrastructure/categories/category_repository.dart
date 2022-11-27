import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/infrastructure/i_resources_repository.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class GetCategoryException extends CustomException {
  const GetCategoryException({String? message}) : super(message: message);
}

class CreateCategoryException extends CustomException {
  const CreateCategoryException({String? message}) : super(message: message);
}

class UpdateCategoryException extends CustomException {
  const UpdateCategoryException({String? message}) : super(message: message);
}

class DeleteCategoryException extends CustomException {
  const DeleteCategoryException({String? message}) : super(message: message);
}

class CategoryRepository extends IResourcesRepository<CategoryModel> {
  CategoryRepository({
    String? path,
    FirebaseFirestore? firebaseFirestore,
    LoggerService? loggerService,
    UuidService? uuidService,
  })  : _loggerService = loggerService ?? Locator.instance(),
        _uuidService = uuidService ?? Locator.instance(),
        super(
          path: path ?? Paths.categories,
          firebaseFirestore: firebaseFirestore ?? FirebaseFirestore.instance,
        );

  final LoggerService _loggerService;
  final UuidService _uuidService;

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
      throw const GetCategoryException(message: 'Failed to retrieve category');
    }
  }

  @override
  Stream<List<CategoryModel>> getAll({
    required String storeId,
    required OrderBy orderBy,
  }) {
    return firebaseFirestore
        .categoryEntitiesCollection(storeId: storeId)
        .orderBy(orderBy.field, descending: orderBy.descending)
        .snapshots()
        .map(
          (doc) => doc.docs.map(CategoryModel.fromSnapshot).toList(),
        );
  }

  @override
  Future<CategoryModel> create({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      final document = firebaseFirestore
          .categoryEntitiesCollection(storeId: storeId)
          .doc(_uuidService.uuid);
      await document.set(resource.toJson());
      final snapshot = await document.get();
      return CategoryModel.fromSnapshot(snapshot);
    } catch (err) {
      _loggerService.log('(create): ${err.toString()}');
      throw CreateCategoryException(
        message:
            'We had an issue creating your ${resource.toFriendlyString()}. Please try again later.',
      );
    }
  }

  @override
  Future<void> update({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      await firebaseFirestore
          .categoryEntitiesDocument(storeId: storeId, categoryId: resource.id!)
          .set(
            resource.copyWith(updatedAt: DateTime.now()).toJson(),
            SetOptions(merge: true),
          );
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      throw UpdateCategoryException(
        message:
            'We had trouble saving your ${resource.toFriendlyString()}. Please try again later.',
      );
    }
  }

  @override
  Future<void> delete({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      await firebaseFirestore
          .categoryEntitiesDocument(storeId: storeId, categoryId: resource.id!)
          .delete();
    } catch (err) {
      _loggerService.log('(delete): ${err.toString()}');
      throw DeleteCategoryException(
        message:
            'There was an issue deleting your ${resource.toFriendlyString()}. Please try again later.',
      );
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
        .map((doc) => doc.docs.map(CategoryModel.fromSnapshot).toList());
  }
}
