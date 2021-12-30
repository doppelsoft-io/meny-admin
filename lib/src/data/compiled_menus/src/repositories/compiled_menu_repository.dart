import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';

class CategoryDoesNotExistException implements Exception {}

class MenuItemDoesNotExistException implements Exception {}

class CompiledMenuRepository {
  final FirebaseFirestore _firebaseFirestore;

  CompiledMenuRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<CategoryModel>> getCategoriesForMenu({required String menuId}) {
    return _firebaseFirestore
        .collection(Paths.menus)
        .doc(menuId)
        .collection(Paths.categories)
        .orderBy('position')
        .snapshots()
        .map((snap) =>
            snap.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList());
  }

  Stream<List<MenuItemModel>> getItemsForCategory({
    required String menuId,
    required String categoryId,
  }) {
    return _firebaseFirestore
        .collection(Paths.menus)
        .doc(menuId)
        .collection(Paths.categories)
        .doc(categoryId)
        .collection(Paths.menuItems)
        .orderBy('position')
        .snapshots()
        .map((snap) =>
            snap.docs.map((doc) => MenuItemModel.fromSnapshot(doc)).toList());
  }

  Future<CategoryModel> getCategory({
    required String menuId,
    required String categoryId,
  }) async {
    try {
      final snap = await _firebaseFirestore
          .collection(Paths.menus)
          .doc(menuId)
          .collection(Paths.categories)
          .doc(categoryId)
          .get();
      if (snap.exists) {
        return CategoryModel.fromSnapshot(snap);
      } else {
        throw CategoryDoesNotExistException();
      }
    } on CategoryDoesNotExistException catch (_) {
      rethrow;
    } catch (err) {
      throw Failure(message: 'Error fetching category');
    }
  }

  Future<void> updateCategory({
    required String menuId,
    required CategoryModel category,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection(Paths.menus)
          .doc(menuId)
          .collection(Paths.categories)
          .doc(category.id)
          .set(category.toJson(), SetOptions(merge: true));
    } catch (err) {
      throw Failure(message: 'Error updating category');
    }
  }

  Future<MenuItemModel> getMenuItem({
    required String menuId,
    required String categoryId,
    required String menuItemId,
  }) async {
    try {
      final snap = await _firebaseFirestore
          .collection(Paths.menus)
          .doc(menuId)
          .collection(Paths.categories)
          .doc(categoryId)
          .collection(Paths.menuItems)
          .doc(menuItemId)
          .get();
      if (snap.exists) {
        return MenuItemModel.fromSnapshot(snap);
      } else {
        throw MenuItemDoesNotExistException();
      }
    } on MenuItemDoesNotExistException catch (_) {
      rethrow;
    } catch (err) {
      throw Failure(message: 'Error fetching item');
    }
  }

  Future<void> updateMenuItem({
    required String menuId,
    required String categoryId,
    required MenuItemModel item,
  }) async {
    try {
      await _firebaseFirestore
          .collection(Paths.menus)
          .doc(menuId)
          .collection(Paths.categories)
          .doc(categoryId)
          .collection(Paths.menuItems)
          .doc(item.id)
          .set(item.toJson(), SetOptions(merge: true));
    } catch (err) {
      throw Failure(message: 'Error updating item');
    }
  }
}
