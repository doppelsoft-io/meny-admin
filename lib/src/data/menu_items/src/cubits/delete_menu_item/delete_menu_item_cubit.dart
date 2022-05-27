import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/data/core/failures.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_core/meny_core.dart';

part 'delete_menu_item_state.dart';
part 'delete_menu_item_cubit.freezed.dart';

class DeleteMenuItemCubit extends Cubit<DeleteMenuItemState> {
  DeleteMenuItemCubit({
    FirebaseFirestore? firebaseFirestore,
    required StoreCubit storeCubit,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _storeCubit = storeCubit,
        super(const DeleteMenuItemState.initial());

  final FirebaseFirestore _firebaseFirestore;
  final StoreCubit _storeCubit;

  Future<void> delete({
    required MenuItemModel item,
    required List<CategoryModel> categories,
  }) async {
    emit(const DeleteMenuItemState.deleting());
    try {
      final storeId = _storeCubit.state.store.id!;
      final batch = _firebaseFirestore.batch();
      final menuItemRef = _firebaseFirestore.menuItemEntitiesDocument(
        storeId: storeId,
        itemId: item.id!,
      );
      batch.delete(menuItemRef);

      for (final category in categories) {
        final docId = '${category.id}-${item.id}';
        final categoryMenuItemRef = _firebaseFirestore
            .collection(Paths.stores)
            .doc(storeId)
            .collection(Paths.categoryMenuItems)
            .doc(docId);

        batch.delete(categoryMenuItemRef);
      }

      await batch.commit();

      emit(const DeleteMenuItemState.success());
    } catch (err) {
      emit(
        const DeleteMenuItemState.error(
          exception: Failure(message: 'Failed to delete item'),
        ),
      );
    } finally {
      emit(const DeleteMenuItemState.initial());
    }
  }
}
