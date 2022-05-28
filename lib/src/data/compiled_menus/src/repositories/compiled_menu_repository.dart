import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_core/meny_core.dart';

class CategoryDoesNotExistException implements Exception {}

class MenuItemDoesNotExistException implements Exception {}

class CompiledMenuRepository {
  CompiledMenuRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? Locator.instance();

  final FirebaseFirestore _firebaseFirestore;

  Stream<List<CategoryModel>> getCategoriesForMenu({
    required String storeId,
    required String menuId,
  }) {
    return _firebaseFirestore
        .compiledCategoriesCollection(
          storeId: storeId,
          menuId: menuId,
        )
        .orderBy('position')
        .snapshots()
        .map(
          (snap) => snap.docs.map(CategoryModel.fromSnapshot).toList(),
        );
  }

  Stream<List<MenuItemModel>> getItemsForCategory({
    required String storeId,
    required String menuId,
    required String categoryId,
  }) {
    return _firebaseFirestore
        .compiledMenuItemsCollection(
          storeId: storeId,
          menuId: menuId,
          categoryId: categoryId,
        )
        .orderBy('position')
        .snapshots()
        .map(
          (snap) => snap.docs.map(MenuItemModel.fromSnapshot).toList(),
        );
  }

  Future<CategoryModel> getCategory({
    required String storeId,
    required String menuId,
    required String categoryId,
  }) async {
    try {
      final snap = await _firebaseFirestore
          .compiledCategoriesDocument(
            storeId: storeId,
            menuId: menuId,
            categoryId: categoryId,
          )
          .get();
      if (snap.exists) {
        return CategoryModel.fromSnapshot(snap);
      } else {
        throw CategoryDoesNotExistException();
      }
    } on CategoryDoesNotExistException catch (_) {
      rethrow;
    } catch (err) {
      throw const CustomException(message: 'Error fetching category');
    }
  }

  Future<void> updateCategory({
    required String storeId,
    required String menuId,
    required CategoryModel category,
  }) async {
    try {
      await _firebaseFirestore
          .compiledCategoriesDocument(
            storeId: storeId,
            menuId: menuId,
            categoryId: category.id!,
          )
          .set(category.toJson(), SetOptions(merge: true));
    } catch (err) {
      throw const CustomException(message: 'Error updating category');
    }
  }

  Future<MenuItemModel> getMenuItem({
    required String storeId,
    required String menuId,
    required String categoryId,
    required String menuItemId,
  }) async {
    try {
      final snap = await _firebaseFirestore
          .compiledMenuItemsDocument(
            storeId: storeId,
            menuId: menuId,
            categoryId: categoryId,
            itemId: menuItemId,
          )
          .get();
      if (snap.exists) {
        return MenuItemModel.fromSnapshot(snap);
      } else {
        throw MenuItemDoesNotExistException();
      }
    } on MenuItemDoesNotExistException catch (_) {
      rethrow;
    } catch (err) {
      throw const CustomException(message: 'Error fetching item');
    }
  }

  Future<void> updateMenuItem({
    required String storeId,
    required String menuId,
    required String categoryId,
    required MenuItemModel item,
  }) async {
    try {
      await _firebaseFirestore
          .compiledMenuItemsDocument(
            storeId: storeId,
            menuId: menuId,
            categoryId: categoryId,
            itemId: item.id!,
          )
          .set(item.toJson(), SetOptions(merge: true));
    } catch (err) {
      throw const CustomException(message: 'Error updating item');
    }
  }
}
