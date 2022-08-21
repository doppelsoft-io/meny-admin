import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_core/meny_core.dart';

part 'delete_modifier_group_state.dart';
part 'delete_modifier_group_cubit.freezed.dart';

class DeleteModifierGroupCubit extends Cubit<DeleteModifierGroupState> {
  DeleteModifierGroupCubit({
    required StoreCubit storeCubit,
    FirebaseFirestore? firebaseFirestore,
  })  : _storeCubit = storeCubit,
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        super(const DeleteModifierGroupState.initial());

  final StoreCubit _storeCubit;
  final FirebaseFirestore _firebaseFirestore;

  Future<void> delete({
    required ModifierGroupModel modifierGroup,
    required List<ModifierGroupItemModel> modifierGroupItems,
  }) async {
    try {
      final storeId = _storeCubit.state.store.id!;
      final batch = _firebaseFirestore.batch();
      final modifierGroupRef = _firebaseFirestore
          .collection(Paths.stores)
          .doc(storeId)
          .collection(Paths.modifierGroups)
          .doc(modifierGroup.id);

      batch.delete(modifierGroupRef);

      for (final modifierGroupItem in modifierGroupItems) {
        final documentId =
            '${modifierGroup.id}-${modifierGroupItem.menuItemId}';
        final modifierGroupItemRef = _firebaseFirestore
            .collection(Paths.stores)
            .doc(storeId)
            .collection(Paths.modifierGroupItems)
            .doc(documentId);

        batch.delete(modifierGroupItemRef);
      }

      await batch.commit();

      emit(const _Success());
    } catch (err) {
      emit(
        const _Error(
          exception: CustomException(
            message: 'Failed to delete modifier group',
          ),
        ),
      );
    } finally {
      emit(const _Initial());
    }
  }
}
