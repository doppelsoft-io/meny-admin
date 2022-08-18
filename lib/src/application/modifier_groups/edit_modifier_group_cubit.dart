import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_modifier_group_state.dart';
part 'edit_modifier_group_cubit.freezed.dart';

class EditModifierGroupCubit extends Cubit<EditModifierGroupState> {
  EditModifierGroupCubit({
    required StoreCubit storeCubit,
    required String modifierGroupId,
    ModifierGroupRepository? modifierGroupRepository,
  })  : _storeCubit = storeCubit,
        _modifierGroupId = modifierGroupId,
        _modifierGroupRepository =
            modifierGroupRepository ?? Locator.instance(),
        super(_Loading(group: ModifierGroupModel.empty())) {
    _subscription?.cancel();

    /// If store already loaded (when already in app)
    _storeCubit.state.maybeWhen(
      loaded: (store) {
        loadItem(id: _modifierGroupId);
      },
      orElse: () {
        /// Otherwise, listen to store stream (reloads page)
        _subscription = _storeCubit.stream.listen((state) {
          state.maybeWhen(
            loaded: (store) {
              loadItem(id: _modifierGroupId);
            },
            orElse: () {},
          );
        });
      },
    );
  }

  final StoreCubit _storeCubit;
  final String _modifierGroupId;
  final ModifierGroupRepository _modifierGroupRepository;
  StreamSubscription<StoreState>? _subscription;

  Future<void> loadItem({required String id}) async {
    try {
      final storeId = _storeCubit.state.store.id!;
      final group = await _modifierGroupRepository.get(
        storeId: storeId,
        id: id,
      );
      emit(_Loaded(group: group));
    } on CreateModifierGroupException catch (err) {
      emit(
        _Error(
          group: state.group,
          exception: err,
        ),
      );
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
