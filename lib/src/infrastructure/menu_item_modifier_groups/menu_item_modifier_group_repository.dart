import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/services.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_core/meny_core.dart';

class GetMenuItemModifierGroupException extends CustomException {
  const GetMenuItemModifierGroupException({String? message})
      : super(message: message ?? 'Failed to get menu item modifier.');
}

class CreateMenuItemModifierGroupException extends CustomException {
  const CreateMenuItemModifierGroupException({String? message})
      : super(message: message ?? 'Failed to link modifier group to item.');
}

class UpdateMenuItemModifierGroupException extends CustomException {
  const UpdateMenuItemModifierGroupException({String? message})
      : super(message: message ?? 'Failed to update.');
}

class RemoveMenuItemModifierGroupException extends CustomException {
  const RemoveMenuItemModifierGroupException({String? message})
      : super(message: message ?? 'Failed to remove modifier group from item.');
}

class GetMenuItemModifierGroupsException extends CustomException {
  const GetMenuItemModifierGroupsException({String? message})
      : super(message: message ?? 'Something went wrong');
}

class MenuItemModifierGroupRepository {
  MenuItemModifierGroupRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? Locator.instance<FirebaseFirestore>();

  final FirebaseFirestore _firebaseFirestore;

  Future<MenuItemModifierGroupModel> get({
    required String storeId,
    required String menuItemId,
    required String modifierGroupId,
  }) async {
    try {
      final documentId = '$menuItemId-$modifierGroupId';
      final snap = await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuItemModifierGroups)
          .doc(documentId)
          .get();
      return MenuItemModifierGroupModel.fromSnapshot(snap);
    } catch (err) {
      throw const GetMenuItemModifierGroupException();
    }
  }

  Stream<List<MenuItemModifierGroupModel>> streamForMenuItem({
    required String storeId,
    required String menuItemId,
    OrderBy orderBy = const OrderBy(),
  }) {
    return _firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(Paths.menuItemModifierGroups)
        .where('menuItemId', isEqualTo: menuItemId)
        .orderBy(orderBy.field, descending: orderBy.descending)
        .snapshots()
        .map(
          (doc) =>
              doc.docs.map(MenuItemModifierGroupModel.fromSnapshot).toList(),
        );
  }

  Stream<List<MenuItemModifierGroupModel>> streamForModifierGroup({
    required String storeId,
    required String modifierGroupId,
    OrderBy orderBy = const OrderBy(),
  }) {
    return _firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(Paths.menuItemModifierGroups)
        .where('modifierGroupId', isEqualTo: modifierGroupId)
        .orderBy(orderBy.field, descending: orderBy.descending)
        .snapshots()
        .map(
          (doc) =>
              doc.docs.map(MenuItemModifierGroupModel.fromSnapshot).toList(),
        );
  }

  Future<MenuItemModifierGroupModel> create({
    required String storeId,
    required String menuItemId,
    required String modifierGroupId,
  }) async {
    try {
      final documentId = '$menuItemId-$modifierGroupId';
      final menuItemModifierGroup = MenuItemModifierGroupModel(
        menuItemId: menuItemId,
        modifierGroupId: modifierGroupId,
      ).copyWith(createdAt: DateTime.now());

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuItemModifierGroups)
          .doc(documentId)
          .set(menuItemModifierGroup.toJson());

      return menuItemModifierGroup;
    } on PlatformException catch (err) {
      throw CreateMenuItemModifierGroupException(message: err.message);
    } on FirebaseException catch (err) {
      throw CreateMenuItemModifierGroupException(message: err.message);
    } catch (_) {
      throw const CreateMenuItemModifierGroupException();
    }
  }

  Future<bool> update({
    required String storeId,
    required MenuItemModifierGroupModel model,
  }) async {
    try {
      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuItemModifierGroups)
          .doc(model.id)
          .set(model.toJson(), SetOptions(merge: true));

      return true;
    } on PlatformException catch (err) {
      throw UpdateMenuItemModifierGroupException(message: err.message);
    } on FirebaseException catch (err) {
      throw UpdateMenuItemModifierGroupException(message: err.message);
    } catch (_) {
      throw const UpdateMenuItemModifierGroupException();
    }
  }

  Future<bool> remove({
    required String storeId,
    required String menuItemId,
    required String modifierGroupId,
  }) async {
    try {
      final documentId = '$menuItemId-$modifierGroupId';

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.menuItemModifierGroups)
          .doc(documentId)
          .delete();

      return true;
    } catch (_) {
      throw const RemoveMenuItemModifierGroupException();
    }
  }
}
