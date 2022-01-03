import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/callables.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/extensions/extensions.dart';

part 'delete_menu_item_state.dart';

class DeleteMenuItemCubit extends Cubit<DeleteMenuItemState> {
  final FirebaseFirestore _firebaseFirestore;
  final StoreCacheService _storeCacheService;

  DeleteMenuItemCubit({
    FirebaseFirestore? firebaseFirestore,
    StoreCacheService? storeCacheService,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(DeleteMenuItemState.initial());

  void delete({
    required MenuItemEntity item,
    required List<CategoryEntity> categories,
  }) async {
    emit(state.copyWith(
      status: DeleteMenuItemStatus.deleting,
      failure: null,
    ));

    try {
      final storeId = await _storeCacheService.get('storeId');
      final batch = _firebaseFirestore.batch();
      final menuItemRef = _firebaseFirestore.menuItemEntitiesDocument(
        storeId: storeId,
        itemId: item.id!,
      );
      batch.delete(menuItemRef);

      for (final category in categories) {
        final updatedCategory = category.copyWith(
          itemIds: List.from(category.itemIds)..remove(item.id),
        );
        final categoryRef = _firebaseFirestore.categoryEntitiesDocument(
          storeId: storeId,
          categoryId: category.id!,
        );
        batch.update(categoryRef, updatedCategory.toJson());
      }

      final menusQuery = await _firebaseFirestore
          .menuEntitiesCollection(storeId: storeId)
          .get();
      final menus =
          menusQuery.docs.map((snap) => MenuEntity.fromSnapshot(snap)).toList();

      final compiledMenuItemFutures = List.generate(
        menus.length,
        (index) async {
          final menu = menus[index];
          final categories = List.generate(
            menu.categoryIds.length,
            (index) async {
              final categoryId = menu.categoryIds[index];
              final menuItemRef = _firebaseFirestore.compiledMenuItemsDocument(
                storeId: storeId,
                menuId: menu.id!,
                categoryId: categoryId,
                itemId: item.id!,
              );
              final menuItemDoc = await menuItemRef.get();
              if (menuItemDoc.exists) {
                final callable = FirebaseFunctions.instance
                    .httpsCallable(Callables.recursiveDelete);

                return await callable({'path': menuItemRef.path});
              }
            },
          );
          return await Future.wait(categories);
        },
      );
      await Future.wait(compiledMenuItemFutures);

      await batch.commit();

      emit(
        state.copyWith(
          status: DeleteMenuItemStatus.success,
          failure: null,
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(
          status: DeleteMenuItemStatus.error,
          failure: Failure(
            message: 'Deleting menu item failed.',
          ),
        ),
      );
    }
  }
}
