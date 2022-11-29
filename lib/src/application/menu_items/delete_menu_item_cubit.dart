import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_core/meny_core.dart';

part 'delete_menu_item_state.dart';
part 'delete_menu_item_cubit.freezed.dart';

class DeleteMenuItemCubit extends Cubit<DeleteMenuItemState> {
  DeleteMenuItemCubit({
    required StoreCubit storeCubit,
    FirebaseFirestore? firebaseFirestore,
    FirebaseStorage? firebaseStorage,
  })  : _storeCubit = storeCubit,
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _firebaseStorage = firebaseStorage ?? Locator.instance(),
        super(const DeleteMenuItemState.initial());

  final StoreCubit _storeCubit;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  Future<void> delete({
    required MenuItemModel item,
    required List<CategoryModel> categories,
    required List<ModifierGroupModel> modifierGroups,
  }) async {
    emit(const _Deleting());
    try {
      final storeId = _storeCubit.state.store.id!;
      final batch = _firebaseFirestore.batch();
      final menuItemRef = _firebaseFirestore.menuItemEntitiesDocument(
        storeId: storeId,
        itemId: item.id!,
      );
      batch.delete(menuItemRef);

      /// Delete associated category menu items
      for (final category in categories) {
        final docId = '${category.id}-${item.id}';
        final categoryMenuItemRef = _firebaseFirestore
            .collection(Paths.stores)
            .doc(storeId)
            .collection(Paths.categoryMenuItems)
            .doc(docId);

        batch.delete(categoryMenuItemRef);
      }

      /// Delete associated menu item modifier groups
      for (final modifierGroup in modifierGroups) {
        final docId = '${item.id}-${modifierGroup.id}';
        final menuItemModifierGroupRef = _firebaseFirestore
            .collection(Paths.stores)
            .doc(storeId)
            .collection(Paths.menuItemModifierGroups)
            .doc(docId);

        batch.delete(menuItemModifierGroupRef);
      }

      await batch.commit();

      emit(const _Success());

      final storageRef = _firebaseStorage.ref();
      final photoRef = storageRef.child('stores/$storeId/items/${item.id}');
      await photoRef.delete();
    } catch (err) {
      emit(
        const _Error(
          exception: CustomException(message: 'Failed to delete item'),
        ),
      );
    } finally {
      emit(const _Initial());
    }
  }
}
