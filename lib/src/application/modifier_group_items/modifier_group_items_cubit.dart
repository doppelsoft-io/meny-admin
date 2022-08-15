import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/domain/core/order_by.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'modifier_group_items_state.dart';
part 'modifier_group_items_cubit.freezed.dart';

class ModifierGroupItemsCubit extends Cubit<ModifierGroupItemsState> {
  ModifierGroupItemsCubit({
    required StoreCubit storeCubit,
    ModifierGroupItemRepository? modifierGroupItemRepository,
    MenuItemRepository? menuItemRepository,
  })  : _storeCubit = storeCubit,
        _modifierGroupItemRepository =
            modifierGroupItemRepository ?? Locator.instance(),
        _menuItemRepository = menuItemRepository ?? Locator.instance(),
        super(const ModifierGroupItemsState.initial());

  final StoreCubit _storeCubit;
  final ModifierGroupItemRepository _modifierGroupItemRepository;
  final MenuItemRepository _menuItemRepository;
  StreamSubscription? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({required String modifierGroupId}) async {
    final storeId = _storeCubit.state.store.id!;
    final menuItems = await _menuItemRepository
        .getAll(
          storeId: storeId,
          orderBy: OrderBy.fallback(),
        )
        .first;

    _subscription = _modifierGroupItemRepository
        .streamForModifierGroup(
      storeId: storeId,
      modifierGroupId: modifierGroupId,
    )
        .listen((modifierGroupItems) {
      syncAvailableMenuItems(
        modifierGroupItems: modifierGroupItems,
        menuItems: menuItems,
      );
    });
  }

  Future<void> createModifierGroupItem({
    required MenuItemModel item,
    required ModifierGroupModel modifierGroup,
  }) async {
    emit(
      _Adding(
        items: state.items,
        modifierGroupItems: state.modifierGroupItems,
      ),
    );
    try {
      final storeId = _storeCubit.state.store.id!;
      await _modifierGroupItemRepository.create(
        storeId: storeId,
        menuItemId: item.id!,
        modifierGroupId: modifierGroup.id!,
        price: item.priceInfo.price,
      );
      emit(
        _Success(
          items: state.items,
          modifierGroupItems: state.modifierGroupItems,
        ),
      );
    } on CreateModifierGroupItemException catch (err) {
      emit(
        _Error(
          items: state.items,
          modifierGroupItems: state.modifierGroupItems,
          exception: err,
        ),
      );
    } finally {
      emit(
        _Initial(
          items: state.items,
          modifierGroupItems: state.modifierGroupItems,
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
        items: state.items,
        modifierGroupItems: state.modifierGroupItems,
      ),
    );
    try {
      final storeId = _storeCubit.state.store.id!;
      await _modifierGroupItemRepository.remove(
        storeId: storeId,
        menuItemId: item.id!,
        modifierGroupId: modifierGroup.id!,
      );
      emit(
        _Success(
          items: state.items,
          modifierGroupItems: state.modifierGroupItems,
        ),
      );
    } on RemoveModifierGroupItemException catch (err) {
      emit(
        _Error(
          items: state.items,
          modifierGroupItems: state.modifierGroupItems,
          exception: err,
        ),
      );
    } finally {
      emit(
        _Initial(
          items: state.items,
          modifierGroupItems: state.modifierGroupItems,
        ),
      );
    }
  }

  Future<void> syncAvailableMenuItems({
    required List<ModifierGroupItemModel> modifierGroupItems,
    required List<MenuItemModel> menuItems,
  }) async {
    final modifierGroupItemIds =
        modifierGroupItems.map((e) => e.menuItemId).toList();
    final menuItemsAvailable = List<MenuItemModel>.from(menuItems)
        .where((item) => modifierGroupItemIds.contains(item.id))
        .toList()
      ..sort((a, b) => a.createdAt!.isAfter(b.createdAt!) ? 1 : 0);

    emit(
      state.copyWith(
        items: menuItemsAvailable,
        modifierGroupItems: modifierGroupItems,
      ),
    );
  }
}
