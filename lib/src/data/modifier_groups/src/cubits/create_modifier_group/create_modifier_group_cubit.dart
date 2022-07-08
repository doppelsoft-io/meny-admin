import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/modifier_groups/modifier_groups.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_core/meny_core.dart';

part 'create_modifier_group_cubit.freezed.dart';
part 'create_modifier_group_state.dart';

class CreateModifierGroupCubit extends Cubit<CreateModifierGroupState> {
  CreateModifierGroupCubit({
    required StoreCubit storeCubit,
    ModifierGroupRepository? modifierGroupRepository,
  })  : _storeCubit = storeCubit,
        _modifierGroupRepository =
            modifierGroupRepository ?? Locator.instance(),
        super(_Initial(group: ModifierGroupModel.empty()));
  final StoreCubit _storeCubit;
  final ModifierGroupRepository _modifierGroupRepository;

  Future<void> create() async {
    emit(_Creating(group: state.group));

    try {
      final storeId = _storeCubit.state.store.id!;
      final newMenu = await _modifierGroupRepository.create(
        storeId: storeId,
        resource: state.group.copyWith(createdAt: DateTime.now()),
      );
      emit(_Created(group: newMenu));
    } on CreateModifierGroupException catch (err) {
      emit(
        _Error(
          group: state.group,
          exception: err,
        ),
      );
    }
  }
}
