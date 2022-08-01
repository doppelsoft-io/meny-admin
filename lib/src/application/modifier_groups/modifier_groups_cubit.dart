import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'modifier_groups_state.dart';
part 'modifier_groups_cubit.freezed.dart';

class ModifierGroupsCubit extends Cubit<ModifierGroupsState> {
  ModifierGroupsCubit({
    ModifierGroupRepository? modifierGroupRepository,
  })  : _modifierGroupRepository =
            modifierGroupRepository ?? Locator.instance(),
        super(const ModifierGroupsState.loading());

  final ModifierGroupRepository _modifierGroupRepository;
  StreamSubscription? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({required String storeId}) async {
    await _subscription?.cancel();
    _subscription =
        _modifierGroupRepository.getAll(storeId: storeId).listen((groups) {
      emit(ModifierGroupsState.loaded(groups: groups));
    })
          ..onError(
            (error) {
              emit(
                ModifierGroupsState.error(
                  groups: state.groups,
                  exception: const CustomException(
                    message: 'Failed to load modifier groups',
                  ),
                ),
              );
            },
          );
  }
}
