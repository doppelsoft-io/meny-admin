import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/typedefs/typedefs.dart';
import 'package:meny_core/meny_core.dart';

class MenuCategoryException implements Exception {
  const MenuCategoryException({String? message})
      : message = message ?? 'Something went wrong';

  final String? message;

  @override
  String toString() => message!;
}

class GetMenuCategoryException extends MenuCategoryException {
  const GetMenuCategoryException({String? message})
      : super(message: message ?? 'Failed to get category menu.');
}

class CreateMenuCategoryException extends MenuCategoryException {
  const CreateMenuCategoryException({String? message})
      : super(message: message ?? 'Failed to link category with menu.');
}

class UpdateMenuCategoryException extends MenuCategoryException {
  const UpdateMenuCategoryException({String? message})
      : super(message: message ?? 'Failed to update category menu.');
}

class RemoveMenuCategoryException extends MenuCategoryException {
  const RemoveMenuCategoryException({String? message})
      : super(message: message ?? 'Failed to remove category from menu.');
}

class GetMenuCategoriesException extends MenuCategoryException {
  const GetMenuCategoriesException({String? message})
      : super(message: message ?? 'Failed to get menu categories');
}

class MenuCategoryRepository {
  MenuCategoryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? Locator.instance<FirebaseFirestore>();

  final FirebaseFirestore _firebaseFirestore;

  Future<MenuCategoryModel> get({
    required String storeId,
    required String menuId,
    required String categoryId,
  }) async {
    try {
      final documentId = '$menuId-$categoryId';
      final snap = await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .doc(documentId)
          .get();
      return MenuCategoryModel.fromSnapshot(snap);
    } catch (err) {
      throw const GetMenuCategoryException();
    }
  }

  Future<List<MenuCategoryModel>> getForMenu({
    required String storeId,
    required String menuId,
    OrderBy? orderBy,
  }) {
    try {
      return streamForMenu(
        storeId: storeId,
        menuId: menuId,
        orderBy: orderBy,
      ).first;
    } catch (err) {
      throw const GetMenuCategoriesException();
    }
  }

  Stream<List<MenuCategoryModel>> streamForMenu({
    required String storeId,
    required String menuId,
    OrderBy? orderBy,
  }) {
    try {
      final _orderBy = orderBy ??= const OrderBy('createdAt', true);

      return _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .where('menuId', isEqualTo: menuId)
          .orderBy(_orderBy.value1, descending: _orderBy.value2)
          .snapshots()
          .map(
            (doc) => doc.docs.map(MenuCategoryModel.fromSnapshot).toList(),
          );
    } catch (err) {
      throw const GetMenuCategoriesException();
    }
  }

  Future<List<MenuCategoryModel>> getForCategory({
    required String storeId,
    required String categoryId,
    OrderBy? orderBy,
  }) {
    try {
      return streamForCategory(
        storeId: storeId,
        categoryId: categoryId,
        orderBy: orderBy,
      ).first;
    } catch (err) {
      throw const GetMenuCategoriesException();
    }
  }

  Stream<List<MenuCategoryModel>> streamForCategory({
    required String storeId,
    required String categoryId,
    OrderBy? orderBy,
  }) {
    try {
      final _orderBy = orderBy ??= const OrderBy('createdAt', true);

      return _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .where('categoryId', isEqualTo: categoryId)
          .orderBy(_orderBy.value1, descending: _orderBy.value2)
          .snapshots()
          .map(
            (doc) => doc.docs.map(MenuCategoryModel.fromSnapshot).toList(),
          );
    } catch (err) {
      throw const GetMenuCategoriesException();
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
      ).copyWith(createdAt: DateTime.now());

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .doc(documentId)
          .set(menuCategory.toJson());

      return menuCategory;
    } catch (_) {
      throw const CreateMenuCategoryException();
    }
  }

  Future<bool> update({
    required String storeId,
    required MenuCategoryModel model,
  }) async {
    try {
      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuCategories)
          .doc(model.id)
          .set(model.toJson(), SetOptions(merge: true));

      return true;
    } catch (_) {
      throw const UpdateMenuCategoryException();
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
      throw const RemoveMenuCategoryException();
    }
  }
}
