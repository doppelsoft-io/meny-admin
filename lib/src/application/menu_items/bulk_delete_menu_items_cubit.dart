import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';

part 'bulk_delete_menu_items_state.dart';
part 'bulk_delete_menu_items_cubit.freezed.dart';

class BulkDeleteMenuItemsCubit extends Cubit<BulkDeleteMenuItemsState> {
  BulkDeleteMenuItemsCubit({
    required StoreCubit storeCubit,
    FirebaseFirestore? firebaseFirestore,
    FirebaseStorage? firebaseStorage,
    MenuItemModifierGroupRepository? menuItemModifierGroupRepository,
    CategoryMenuItemsRepository? categoryMenuItemsRepository,
  })  : _storeCubit = storeCubit,
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _firebaseStorage = firebaseStorage ?? Locator.instance(),
        _menuItemModifierGroupRepository =
            menuItemModifierGroupRepository ?? Locator.instance(),
        _categoryMenuItemsRepository =
            categoryMenuItemsRepository ?? Locator.instance(),
        super(const BulkDeleteMenuItemsState.initial());

  final StoreCubit _storeCubit;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;
  final MenuItemModifierGroupRepository _menuItemModifierGroupRepository;
  final CategoryMenuItemsRepository _categoryMenuItemsRepository;

  WriteBatch _addMenuItemToBatch(String menuItemId, WriteBatch batch) {
    final storeId = _storeCubit.state.store.id!;
    final menuItemRef = _firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(Paths.menuItems)
        .doc(menuItemId);
    batch.delete(menuItemRef);
    return batch;
  }

  WriteBatch _addCategoryMenuItemsToBatch(
    String categoryMenuItemId,
    WriteBatch batch,
  ) {
    final storeId = _storeCubit.state.store.id!;

    final categoryMenuItemRef = _firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(Paths.categoryMenuItems)
        .doc(categoryMenuItemId);

    batch.delete(categoryMenuItemRef);
    return batch;
  }

  WriteBatch _addMenuItemModifierGroupsToBatch(
    String? menuItemModifierGroupId,
    WriteBatch batch,
  ) {
    final storeId = _storeCubit.state.store.id!;
    final menuItemModifierGroupRef = _firebaseFirestore
        .collection(Paths.stores)
        .doc(storeId)
        .collection(Paths.menuItemModifierGroups)
        .doc(menuItemModifierGroupId);

    batch.delete(menuItemModifierGroupRef);
    return batch;
  }

  Future<void> batchDelete({required List<String> menuItemIds}) async {
    try {
      //
      emit(const _Deleting());
      final storeId = _storeCubit.state.store.id!;
      final batch = _firebaseFirestore.batch();

      for (final menuItemId in menuItemIds) {
        _addMenuItemToBatch(menuItemId, batch);

        final categoryMenuItems =
            await _categoryMenuItemsRepository.getForMenuItem(
          storeId: storeId,
          menuItemId: menuItemId,
        );

        for (final categoryMenuItem in categoryMenuItems) {
          _addCategoryMenuItemsToBatch(categoryMenuItem.id!, batch);
        }

        final menuItemModifierGroups = await _menuItemModifierGroupRepository
            .streamForMenuItem(storeId: storeId, menuItemId: menuItemId)
            .first;

        for (final group in menuItemModifierGroups) {
          _addMenuItemModifierGroupsToBatch(
            group.id,
            batch,
          );
        }
      }
      await batch.commit();

      emit(const _Success());

      final storageRef = _firebaseStorage.ref();
      final storageFutures = List.generate(menuItemIds.length, (i) {
        final photoRef =
            storageRef.child('stores/$storeId/items/${menuItemIds[i]}');
        try {
          return photoRef.delete();
        } catch (err) {
          return Future.value(false);
        }
      });

      unawaited(Future.wait(storageFutures));
    } catch (err) {
      emit(
        const _Error(
          exception: CustomException(message: 'Failed to delete menu items'),
        ),
      );
    }
  }
}
