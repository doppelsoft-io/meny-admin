import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/modifier_groups/modifier_groups.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_modifier_group_state.dart';
part 'edit_modifier_group_cubit.freezed.dart';

class EditModifierGroupCubit extends Cubit<EditModifierGroupState> {
  EditModifierGroupCubit({
    required StoreCubit storeCubit,
    ModifierGroupRepository? modifierGroupRepository,
    FirebaseFirestore? firebaseFirestore,
  })  : _storeCubit = storeCubit,
        _modifierGroupRepository =
            modifierGroupRepository ?? Locator.instance(),
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        super(_Loading(group: ModifierGroupModel.empty()));

  final StoreCubit _storeCubit;
  final ModifierGroupRepository _modifierGroupRepository;
  final FirebaseFirestore _firebaseFirestore;

  Future<void> loadItem(ModifierGroupModel group) async {
    if (group.id != null && group.id!.isNotEmpty) {
      /// Needed to trigger loaded event in listener
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(_Loaded(group: group));
    } else {
      try {
        final storeId = _storeCubit.state.store.id!;
        final newItem = await _modifierGroupRepository.create(
          storeId: storeId,
          resource: group.copyWith(createdAt: DateTime.now()),
        );
        emit(_Loaded(group: newItem));
      } on CreateModifierGroupException catch (err) {
        emit(
          _Error(
            group: group,
            exception: err,
          ),
        );
      }
    }
  }

  Future<void> update(ModifierGroupModel group) async {
    emit(_Updating(group: group));

    try {
      final storeId = _storeCubit.state.store.id!;
      await _modifierGroupRepository.update(
        storeId: storeId,
        resource: group,
      );
      emit(_Success(group: group));
    } on UpdateModifierGroupException catch (err) {
      emit(
        _Error(
          group: group,
          exception: err,
        ),
      );
    }
  }

  void updateQuantityConstraints(QuantityConstraintRules rules) {
    final updatedGroup = state.group.copyWith(quantityConstraints: rules);

    emit(state.copyWith(group: updatedGroup));
  }
}
