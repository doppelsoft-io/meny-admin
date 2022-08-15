import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/services.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_core/meny_core.dart';

class GetModifierGroupItemException extends CustomException {
  const GetModifierGroupItemException({String? message})
      : super(message: message ?? 'Failed to get menu item modifier.');
}

class CreateModifierGroupItemException extends CustomException {
  const CreateModifierGroupItemException({String? message})
      : super(message: message ?? 'Failed to link modifier group to item.');
}

class UpdateModifierGroupItemException extends CustomException {
  const UpdateModifierGroupItemException({String? message})
      : super(message: message ?? 'Failed to update.');
}

class RemoveModifierGroupItemException extends CustomException {
  const RemoveModifierGroupItemException({String? message})
      : super(message: message ?? 'Failed to remove modifier group from item.');
}

class GetModifierGroupItemsException extends CustomException {
  const GetModifierGroupItemsException({String? message})
      : super(message: message ?? 'Something went wrong');
}

class ModifierGroupItemRepository {
  ModifierGroupItemRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? Locator.instance<FirebaseFirestore>();

  final FirebaseFirestore _firebaseFirestore;

  Future<ModifierGroupItemModel> get({
    required String storeId,
    required String modifierGroupId,
    required String menuItemId,
  }) async {
    try {
      final documentId = '$modifierGroupId-$menuItemId';
      final snap = await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.modifierGroupItems)
          .doc(documentId)
          .get();
      return ModifierGroupItemModel.fromSnapshot(snap);
    } catch (err) {
      throw const GetModifierGroupItemException();
    }
  }

  Stream<List<ModifierGroupItemModel>> streamForMenuItem({
    required String storeId,
    required String menuItemId,
    OrderBy orderBy = const OrderBy('createdAt'),
  }) {
    return _firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(Paths.modifierGroupItems)
        .where('menuItemId', isEqualTo: menuItemId)
        .orderBy(orderBy.field, descending: orderBy.descending)
        .snapshots()
        .map(
          (doc) => doc.docs.map(ModifierGroupItemModel.fromSnapshot).toList(),
        );
  }

  Stream<List<ModifierGroupItemModel>> streamForModifierGroup({
    required String storeId,
    required String modifierGroupId,
    OrderBy orderBy = const OrderBy('createdAt'),
  }) {
    return _firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(Paths.modifierGroupItems)
        .where('modifierGroupId', isEqualTo: modifierGroupId)
        .orderBy(orderBy.field, descending: orderBy.descending)
        .snapshots()
        .map(
          (doc) => doc.docs.map(ModifierGroupItemModel.fromSnapshot).toList(),
        );
  }

  Future<ModifierGroupItemModel> create({
    required String storeId,
    required String modifierGroupId,
    required String menuItemId,
    required int price,
  }) async {
    try {
      final documentId = '$modifierGroupId-$menuItemId';
      final modifierGroupItem = ModifierGroupItemModel(
        menuItemId: menuItemId,
        modifierGroupId: modifierGroupId,
        priceOverride: PriceOverrideModel.forItem(
          price: price,
          itemId: menuItemId,
        ),
      ).copyWith(createdAt: DateTime.now());

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.modifierGroupItems)
          .doc(documentId)
          .set(modifierGroupItem.toJson());

      return modifierGroupItem;
    } on PlatformException catch (err) {
      throw CreateModifierGroupItemException(message: err.message);
    } on FirebaseException catch (err) {
      throw CreateModifierGroupItemException(message: err.message);
    } catch (_) {
      throw const CreateModifierGroupItemException();
    }
  }

  Future<bool> update({
    required String storeId,
    required ModifierGroupItemModel model,
  }) async {
    try {
      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.modifierGroupItems)
          .doc(model.id)
          .set(model.toJson(), SetOptions(merge: true));

      return true;
    } on PlatformException catch (err) {
      throw UpdateModifierGroupItemException(message: err.message);
    } on FirebaseException catch (err) {
      throw UpdateModifierGroupItemException(message: err.message);
    } catch (_) {
      throw const UpdateModifierGroupItemException();
    }
  }

  Future<bool> remove({
    required String storeId,
    required String modifierGroupId,
    required String menuItemId,
  }) async {
    try {
      final documentId = '$modifierGroupId-$menuItemId';

      await _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.modifierGroupItems)
          .doc(documentId)
          .delete();

      return true;
    } catch (_) {
      throw const RemoveModifierGroupItemException();
    }
  }
}
