import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';

part 'delete_menu_item_state.dart';

class DeleteMenuItemCubit extends Cubit<DeleteMenuItemState> {
  final FirebaseFirestore _firebaseFirestore;

  DeleteMenuItemCubit({
    FirebaseFirestore? firebaseFirestore,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
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
      final batch = _firebaseFirestore.batch();
      final menuItemRef =
          _firebaseFirestore.collection(Paths.menuItems).doc(item.id);
      batch.delete(menuItemRef);

      for (final category in categories) {
        final updatedCategory = category.copyWith(
          itemIds: List.from(category.itemIds)..remove(item.id),
        );
        final categoryRef =
            _firebaseFirestore.collection(Paths.categories).doc(category.id);
        batch.update(categoryRef, updatedCategory.toJson());
      }

      final menusRef = await _firebaseFirestore.collection(Paths.menus).get();
      final menus =
          menusRef.docs.map((snap) => MenuEntity.fromSnapshot(snap)).toList();

      final compiledMenuItemFutures = List.generate(
        menus.length,
        (index) async {
          final menu = menus[index];
          final categories = List.generate(
            menu.categoryIds.length,
            (index) async {
              final categoryId = menu.categoryIds[index];
              final menuItemRef = _firebaseFirestore
                  .collection(Paths.menus)
                  .doc(menu.id)
                  .collection(Paths.categories)
                  .doc(categoryId)
                  .collection(Paths.menuItems)
                  .doc(item.id);
              final menuItemDoc = await menuItemRef.get();
              if (menuItemDoc.exists) {
                final callable =
                    FirebaseFunctions.instance.httpsCallable('recursiveDelete');

                final path =
                    '${Paths.menus}/${menu.id}/${Paths.categories}/$categoryId/${Paths.menuItems}/${item.id}';
                return await callable({'path': path});
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
