import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/category_menu_items/category_menu_items.dart';

class CategoryMenuItemException implements Exception {
  final String message;

  const CategoryMenuItemException({this.message = 'Something went wrong'});
}

class CreateCategoryMenuItemException extends CategoryMenuItemException {
  final String message;

  const CreateCategoryMenuItemException({
    this.message = 'Failed to link menu item to category.',
  });
}

class RemoveCategoryMenuItemException extends CategoryMenuItemException {
  final String message;

  const RemoveCategoryMenuItemException({
    this.message = 'Failed to remove menu item from category.',
  });
}

class GetCategoryMenuItemsException extends CategoryMenuItemException {
  final String message;

  const GetCategoryMenuItemsException({
    this.message = 'Failed to get category menu items',
  });
}

class CategoryMenuItemsRepository {
  CategoryMenuItemsRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? Locator.instance<FirebaseFirestore>();

  final FirebaseFirestore _firebaseFirestore;

  Future<List<CategoryMenuItemModel>> getForCategory({
    required String storeId,
    required String categoryId,
  }) async {
    return streamForCategory(storeId: storeId, categoryId: categoryId).first;
  }

  Future<List<CategoryMenuItemModel>> getForMenuItem({
    required String storeId,
    required String menuItemId,
  }) async {
    return streamForMenuItem(storeId: storeId, menuItemId: menuItemId).first;
  }

  Stream<List<CategoryMenuItemModel>> streamForCategory({
    required String storeId,
    required String categoryId,
  }) {
    try {
      return _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .where('categoryId', isEqualTo: categoryId)
          .snapshots()
          .map((doc) => doc.docs
              .map((snap) => CategoryMenuItemModel.fromSnapshot(snap))
              .toList());
    } catch (err) {
      throw GetCategoryMenuItemsException();
    }
  }

  Stream<List<CategoryMenuItemModel>> streamForMenuItem({
    required String storeId,
    required String menuItemId,
  }) {
    try {
      return _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .where('menuItemId', isEqualTo: menuItemId)
          .snapshots()
          .map((doc) => doc.docs
              .map((snap) => CategoryMenuItemModel.fromSnapshot(snap))
              .toList());
    } catch (err) {
      throw GetCategoryMenuItemsException();
    }
  }

  Future<CategoryMenuItemModel> create({
    required String storeId,
    required String categoryId,
    required String menuItemId,
  }) async {
    try {
      final documentId = '$categoryId-$menuItemId';
      final categoryMenuItem = CategoryMenuItemModel(
        menuItemId: menuItemId,
        categoryId: categoryId,
      );

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .doc(documentId)
          .set(categoryMenuItem.toJson());

      return categoryMenuItem;
    } on PlatformException catch (err) {
      throw CreateCategoryMenuItemException(
        message: err.message ?? 'Something went wrong',
      );
    } on FirebaseException catch (err) {
      throw CreateCategoryMenuItemException(
        message: err.message ?? 'Something went wrong',
      );
    } catch (_) {
      throw CreateCategoryMenuItemException();
    }
  }

  Future<bool> remove({
    required String storeId,
    required String categoryId,
    required String menuItemId,
  }) async {
    try {
      final documentId = '$categoryId-$menuItemId';

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .doc(documentId)
          .delete();

      return true;
    } catch (_) {
      throw RemoveCategoryMenuItemException();
    }
  }
}
