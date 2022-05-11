import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/category_menu_items/category_menu_items.dart';
import 'package:meny/src/typedefs/typedefs.dart';

class CategoryMenuItemException implements Exception {
  const CategoryMenuItemException({String? message})
      : message = message ?? 'Something went wrong';

  final String? message;

  @override
  String toString() => message!;
}

class GetCategoryMenuItemException extends CategoryMenuItemException {
  const GetCategoryMenuItemException({String? message})
      : super(message: message ?? 'Failed to get category menu item.');
}

class CreateCategoryMenuItemException extends CategoryMenuItemException {
  const CreateCategoryMenuItemException({String? message})
      : super(message: message ?? 'Failed to link menu item to category.');
}

class UpdateCategoryMenuItemException extends CategoryMenuItemException {
  const UpdateCategoryMenuItemException({String? message})
      : super(message: message ?? 'Failed to update category menu item.');
}

class RemoveCategoryMenuItemException extends CategoryMenuItemException {
  const RemoveCategoryMenuItemException({String? message})
      : super(message: message ?? 'Failed to remove menu item from category.');
}

class GetCategoryMenuItemsException extends CategoryMenuItemException {
  const GetCategoryMenuItemsException({String? message})
      : super(message: message ?? 'Failed to get category menu items.');
}

class CategoryMenuItemsRepository {
  CategoryMenuItemsRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? Locator.instance<FirebaseFirestore>();

  final FirebaseFirestore _firebaseFirestore;

  Future<CategoryMenuItemModel> get({
    required String storeId,
    required String categoryId,
    required String menuItemId,
  }) async {
    try {
      final documentId = '$categoryId-$menuItemId';
      final snap = await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .doc(documentId)
          .get();
      return CategoryMenuItemModel.fromSnapshot(snap);
    } catch (err) {
      throw const GetCategoryMenuItemException();
    }
  }

  Future<List<CategoryMenuItemModel>> getForCategory({
    required String storeId,
    required String categoryId,
    OrderBy? orderBy,
  }) async {
    return streamForCategory(
      storeId: storeId,
      categoryId: categoryId,
      orderBy: orderBy,
    ).first;
  }

  Future<List<CategoryMenuItemModel>> getForMenuItem({
    required String storeId,
    required String menuItemId,
    OrderBy? orderBy,
  }) async {
    return streamForMenuItem(
      storeId: storeId,
      menuItemId: menuItemId,
      orderBy: orderBy,
    ).first;
  }

  Stream<List<CategoryMenuItemModel>> streamForCategory({
    required String storeId,
    required String categoryId,
    OrderBy? orderBy,
  }) {
    try {
      final _orderBy = orderBy ??= const OrderBy('createdAt', true);
      return _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .where('categoryId', isEqualTo: categoryId)
          .orderBy(_orderBy.value1, descending: _orderBy.value2)
          .snapshots()
          .map(
            (doc) => doc.docs
                .map((snap) => CategoryMenuItemModel.fromSnapshot(snap))
                .toList(),
          );
    } catch (err) {
      throw const GetCategoryMenuItemsException();
    }
  }

  Stream<List<CategoryMenuItemModel>> streamForMenuItem({
    required String storeId,
    required String menuItemId,
    OrderBy? orderBy,
  }) {
    try {
      final _orderBy = orderBy ??= const OrderBy('createdAt', true);
      return _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .where('menuItemId', isEqualTo: menuItemId)
          .orderBy(_orderBy.value1, descending: _orderBy.value2)
          .snapshots()
          .map(
            (doc) => doc.docs
                .map((snap) => CategoryMenuItemModel.fromSnapshot(snap))
                .toList(),
          );
    } catch (err) {
      throw const GetCategoryMenuItemsException();
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
      ).copyWith(createdAt: DateTime.now());

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .doc(documentId)
          .set(categoryMenuItem.toJson());

      return categoryMenuItem;
    } on PlatformException catch (err) {
      throw CreateCategoryMenuItemException(message: err.message);
    } on FirebaseException catch (err) {
      throw CreateCategoryMenuItemException(message: err.message);
    } catch (_) {
      throw const CreateCategoryMenuItemException();
    }
  }

  Future<bool> update({
    required String storeId,
    required CategoryMenuItemModel model,
  }) async {
    try {
      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.categoryMenuItems)
          .doc(model.id)
          .set(model.toJson(), SetOptions(merge: true));

      return true;
    } on PlatformException catch (err) {
      throw UpdateCategoryMenuItemException(message: err.message);
    } on FirebaseException catch (err) {
      throw UpdateCategoryMenuItemException(message: err.message);
    } catch (_) {
      throw const UpdateCategoryMenuItemException();
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
      throw const RemoveCategoryMenuItemException();
    }
  }
}
