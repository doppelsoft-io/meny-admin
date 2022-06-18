import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/menu_item_modifier_groups/menu_item_modifier_groups.dart';
import 'package:meny_admin/src/data/modifier_groups/modifier_groups.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_core/meny_core.dart';

part 'menu_item_modifier_groups_state.dart';
part 'menu_item_modifier_groups_cubit.freezed.dart';

class MenuItemModifierGroupsCubit extends Cubit<MenuItemModifierGroupsState> {
  MenuItemModifierGroupsCubit({
    required StoreCubit storeCubit,
    MenuItemModifierGroupRepository? menuItemModifierGroupRepository,
    ModifierGroupRepository? modifierGroupRepository,
  })  : _storeCubit = storeCubit,
        _menuItemModifierGroupRepository =
            menuItemModifierGroupRepository ?? Locator.instance(),
        _modifierGroupRepository =
            modifierGroupRepository ?? Locator.instance(),
        super(const MenuItemModifierGroupsState.initial());

  final StoreCubit _storeCubit;
  final ModifierGroupRepository _modifierGroupRepository;
  final MenuItemModifierGroupRepository _menuItemModifierGroupRepository;
  StreamSubscription? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({required String menuItemId}) async {
    final storeId = _storeCubit.state.store.id!;
    final modifierGroups =
        await _modifierGroupRepository.getAll(storeId: storeId).first;

    _subscription = _menuItemModifierGroupRepository
        .streamForMenuItem(
      storeId: storeId,
      menuItemId: menuItemId,
    )
        .listen((menuItemModifierGroups) {
      syncAvailableModifierGroups(
        menuItemModifierGroups: menuItemModifierGroups,
        modifierGroups: modifierGroups,
      );
    });
  }

  Future<void> createMenuItemModifierGroup({
    required MenuItemModel item,
    required ModifierGroupModel modifierGroup,
  }) async {
    emit(
      _Adding(
        groups: state.groups,
        menuItemModifierGroups: state.menuItemModifierGroups,
      ),
    );
    try {
      final storeId = _storeCubit.state.store.id!;
      await _menuItemModifierGroupRepository.create(
        storeId: storeId,
        menuItemId: item.id!,
        modifierGroupId: modifierGroup.id!,
      );
      emit(
        _Success(
          groups: state.groups,
          menuItemModifierGroups: state.menuItemModifierGroups,
        ),
      );
    } on CreateMenuItemModifierGroupException catch (err) {
      emit(
        _Error(
          groups: state.groups,
          menuItemModifierGroups: state.menuItemModifierGroups,
          exception: err,
        ),
      );
    } finally {
      emit(
        _Initial(
          groups: state.groups,
          menuItemModifierGroups: state.menuItemModifierGroups,
        ),
      );
    }
  }

  Future<void> removeMenuItemModifierGroup({
    required MenuItemModel item,
    required ModifierGroupModel modifierGroup,
  }) async {
    emit(
      _Removing(
        groups: state.groups,
        menuItemModifierGroups: state.menuItemModifierGroups,
      ),
    );
    try {
      final storeId = _storeCubit.state.store.id!;
      await _menuItemModifierGroupRepository.remove(
        storeId: storeId,
        menuItemId: item.id!,
        modifierGroupId: modifierGroup.id!,
      );
      emit(
        _Success(
          groups: state.groups,
          menuItemModifierGroups: state.menuItemModifierGroups,
        ),
      );
    } on RemoveMenuItemModifierGroupException catch (err) {
      emit(
        _Error(
          groups: state.groups,
          menuItemModifierGroups: state.menuItemModifierGroups,
          exception: err,
        ),
      );
    } finally {
      emit(
        _Initial(
          groups: state.groups,
          menuItemModifierGroups: state.menuItemModifierGroups,
        ),
      );
    }
  }

  Future<void> syncAvailableModifierGroups({
    required List<MenuItemModifierGroupModel> menuItemModifierGroups,
    required List<ModifierGroupModel> modifierGroups,
  }) async {
    final menuItemModifierGroupIds =
        menuItemModifierGroups.map((e) => e.modifierGroupId).toList();
    final modifierGroupsAvailable =
        List<ModifierGroupModel>.from(modifierGroups)
            .where((item) => menuItemModifierGroupIds.contains(item.id))
            .toList()
          ..sort((a, b) => a.createdAt!.isAfter(b.createdAt!) ? 1 : 0);

    emit(
      state.copyWith(
        groups: modifierGroupsAvailable,
        menuItemModifierGroups: menuItemModifierGroups,
      ),
    );
  }
}
