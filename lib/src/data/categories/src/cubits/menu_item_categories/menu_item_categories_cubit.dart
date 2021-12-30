import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/callables.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';

part 'menu_item_categories_state.dart';

class MenuItemCategoriesCubit extends Cubit<MenuItemCategoriesState> {
  final MenuItemEntity _menuItem;
  final MenuRepository _menuRepository;
  final CategoryRepository _categoryRepository;
  final FirebaseFunctions _firebaseFunctions;

  late StreamSubscription _subscription;

  MenuItemCategoriesCubit({
    required MenuItemEntity menuItem,
    MenuRepository? menuRepository,
    CategoryRepository? categoryRepository,
    FirebaseFunctions? firebaseFunctions,
  })  : _menuItem = menuItem,
        _categoryRepository = categoryRepository ?? Locator.instance(),
        _menuRepository = menuRepository ?? Locator.instance(),
        _firebaseFunctions = Locator.instance(),
        super(MenuItemCategoriesState.initial()) {
    _subscription = _categoryRepository
        .getCategoriesForItem(item: _menuItem)
        .listen((categories) {
      emit(state.copyWith(categories: categories));
    });
  }

  @override
  Future<void> close() async {
    super.close();
    _subscription.cancel();
  }

  void removeItemFromCategory({required CategoryEntity category}) async {
    try {
      final updatedCategory = category.copyWith(
        itemIds: List.from(category.itemIds)..remove(_menuItem.id),
      );
      await _categoryRepository.update(resource: updatedCategory);

      final menus = await _menuRepository.getAll().first;
      final menuFutures = List.generate(
        menus.length,
        (index) async {
          final menu = menus[index];
          final recursiveDelete =
              _firebaseFunctions.httpsCallable(Callables.recursiveDelete);
          final path =
              '${Paths.menus}/${menu.id}/${Paths.categories}/${category.id}/${Paths.menuItems}/${_menuItem.id}';
          return await recursiveDelete({'path': path});
        },
      );
      await Future.wait(menuFutures);
      emit(state.copyWith(failure: null));
    } catch (err) {
      emit(state.copyWith(failure: Failure(message: err.toString())));
    }
  }

  void addItemToCategory({required CategoryEntity category}) async {
    try {
      final updatedCategory = category.copyWith(
        itemIds: List.from(category.itemIds)..add(_menuItem.id!),
      );
      emit(state.copyWith(failure: null));
      await _categoryRepository.update(resource: updatedCategory);
    } catch (err) {
      emit(state.copyWith(failure: Failure(message: err.toString())));
    }
  }
}
