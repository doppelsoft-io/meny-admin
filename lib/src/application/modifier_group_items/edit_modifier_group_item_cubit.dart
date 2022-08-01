import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_modifier_group_item_state.dart';
part 'edit_modifier_group_item_cubit.freezed.dart';

class EditModifierGroupItemCubit extends Cubit<EditModifierGroupItemState> {
  EditModifierGroupItemCubit({
    required StoreCubit storeCubit,
    ModifierGroupItemRepository? modifierGroupItemRepository,
  })  : _storeCubit = storeCubit,
        _modifierGroupItemRepository =
            modifierGroupItemRepository ?? Locator.instance(),
        super(
          EditModifierGroupItemState.initial(
            modifierGroupItem: ModifierGroupItemModel.empty(),
          ),
        );

  final StoreCubit _storeCubit;
  final ModifierGroupItemRepository _modifierGroupItemRepository;

  void seed({required ModifierGroupItemModel model}) {
    emit(state.copyWith(modifierGroupItem: model));
  }

  Future<void> update({required ModifierGroupItemModel model}) async {
    try {
      emit(_Updating(modifierGroupItem: state.modifierGroupItem));

      final storeId = _storeCubit.state.store.id!;
      await _modifierGroupItemRepository.update(
        storeId: storeId,
        model: model,
      );

      emit(_Success(modifierGroupItem: model));
    } on UpdateModifierGroupItemException catch (err) {
      emit(
        _Error(
          modifierGroupItem: state.modifierGroupItem,
          exception: err,
        ),
      );
    }
  }
}
