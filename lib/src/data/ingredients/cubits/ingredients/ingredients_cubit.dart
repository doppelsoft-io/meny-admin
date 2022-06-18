import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/menu_items/menu_items.dart';
import 'package:meny_core/meny_core.dart';

part 'ingredients_state.dart';
part 'ingredients_cubit.freezed.dart';

class IngredientsCubit extends Cubit<IngredientsState> {
  IngredientsCubit({
    MenuItemRepository? menuItemRepository,
  })  : _menuItemRepository = menuItemRepository ?? Locator.instance(),
        super(const IngredientsState.loading());

  final MenuItemRepository _menuItemRepository;
  StreamSubscription? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({required String storeId}) async {
    await _subscription?.cancel();
    _subscription = _menuItemRepository
        .getAllByType(
      storeId: storeId,
      type: MenuItemType.ingredient,
    )
        .listen((ingredients) {
      emit(IngredientsState.loaded(items: ingredients));
    })
      ..onError(
        (error) {
          emit(
            IngredientsState.error(
              items: state.items,
              exception: const CustomException(
                message: 'Failed to load ingredients',
              ),
            ),
          );
        },
      );
  }
}
