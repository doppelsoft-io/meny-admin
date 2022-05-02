import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/menu_categories/menu_categories.dart';

class MenuCategoryException implements Exception {
  final String message;

  const MenuCategoryException({this.message = 'Something went wrong'});
}

class CreateMenuCategoryException extends MenuCategoryException {
  final String message;

  const CreateMenuCategoryException({
    this.message = 'Failed to link category with menu.',
  });
}

class RemoveMenuCategoryException extends MenuCategoryException {
  final String message;

  const RemoveMenuCategoryException({
    this.message = 'Failed to remove category from menu.',
  });
}

class GetMenuCategoriesException extends MenuCategoryException {
  final String message;

  const GetMenuCategoriesException({
    this.message = 'Failed to get menu categories',
  });
}

class MenuCategoryRepository {
  MenuCategoryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? Locator.instance<FirebaseFirestore>();

  final FirebaseFirestore _firebaseFirestore;

  Future<List<MenuCategoryModel>> getForMenu({
    required String storeId,
    required String menuId,
  }) {
    try {
      return streamForMenu(
        storeId: storeId,
        menuId: menuId,
      ).first;
    } catch (err) {
      throw GetMenuCategoriesException();
    }
  }

  Stream<List<MenuCategoryModel>> streamForMenu({
    required String storeId,
    required String menuId,
  }) {
    try {
      return _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .where('menuId', isEqualTo: menuId)
          .snapshots()
          .map((doc) => doc.docs
              .map((snap) => MenuCategoryModel.fromSnapshot(snap))
              .toList());
    } catch (err) {
      throw GetMenuCategoriesException();
    }
  }

  Future<List<MenuCategoryModel>> getForCategory({
    required String storeId,
    required String categoryId,
  }) {
    try {
      return streamForCategory(
        storeId: storeId,
        categoryId: categoryId,
      ).first;
    } catch (err) {
      throw GetMenuCategoriesException();
    }
  }

  Stream<List<MenuCategoryModel>> streamForCategory({
    required String storeId,
    required String categoryId,
  }) {
    try {
      return _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .where('categoryId', isEqualTo: categoryId)
          .snapshots()
          .map((doc) => doc.docs
              .map((snap) => MenuCategoryModel.fromSnapshot(snap))
              .toList());
    } catch (err) {
      throw GetMenuCategoriesException();
    }
  }

  Future<MenuCategoryModel> create({
    required String storeId,
    required String menuId,
    required String categoryId,
  }) async {
    try {
      final documentId = '$menuId-$categoryId';
      final menuCategory = MenuCategoryModel(
        menuId: menuId,
        categoryId: categoryId,
      );

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .doc(documentId)
          .set(menuCategory.toJson());

      return menuCategory;
    } catch (_) {
      throw CreateMenuCategoryException();
    }
  }

  Future<bool> remove({
    required String storeId,
    required String menuId,
    required String categoryId,
  }) async {
    try {
      final documentId = '$menuId-$categoryId';

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .doc(documentId)
          .delete();

      return true;
    } catch (_) {
      throw RemoveMenuCategoryException();
    }
  }
}
