import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
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

class CategoryRepository {
  CategoryRepository({
    FirebaseFirestore? firebaseFirestore,
    LoggerService? loggerService,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _loggerService = loggerService ?? Locator.instance();

  final FirebaseFirestore _firebaseFirestore;
  final LoggerService _loggerService;

  Future<CategoryModel> get({
    required String storeId,
    required String id,
  }) async {
    try {
      final snap = await _firebaseFirestore
          .categoryEntitiesDocument(storeId: storeId, categoryId: id)
          .get();
      return CategoryModel.fromSnapshot(snap);
    } catch (err) {
      _loggerService.log('(get): ${err.toString()}');
      throw const GetCategoryException(message: 'Failed to retrieve category');
    }
  }

  @override
  Stream<List<CategoryModel>> getAll({required String storeId}) {
    return _firebaseFirestore
        .categoryEntitiesCollection(storeId: storeId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map(
          (doc) => doc.docs.map(CategoryModel.fromSnapshot).toList(),
        );
  }

  FutureOr<CategoryModel> create({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      final document = await _firebaseFirestore
          .categoryEntitiesCollection(storeId: storeId)
          .add(resource.toJson());
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

  FutureOr<void> update({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      await _firebaseFirestore
          .categoryEntitiesDocument(storeId: storeId, categoryId: resource.id!)
          .set(resource.toJson(), SetOptions(merge: true));
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      throw UpdateCategoryException(
        message:
            'We had trouble updating your ${resource.toFriendlyString()}. Please try again later.',
      );
    }
  }

  Future<void> delete({
    required String storeId,
    required CategoryModel resource,
  }) async {
    try {
      await _firebaseFirestore
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
    return _firebaseFirestore
        .categoryEntitiesCollection(storeId: storeId)
        .where('itemIds', arrayContains: item.id)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map(
          (doc) => doc.docs.map(CategoryModel.fromSnapshot).toList(),
        );
  }
}
