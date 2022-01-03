import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/callables.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/extensions/extensions.dart';

part 'menu_item_categories_state.dart';

class MenuItemCategoriesCubit extends Cubit<MenuItemCategoriesState> {
  final MenuItemEntity _menuItem;
  final MenuRepository _menuRepository;
  final CategoryRepository _categoryRepository;
  final FirebaseFunctions _firebaseFunctions;
  final FirebaseFirestore _firebaseFirestore;
  final StoreCacheService _storeCacheService;

  late StreamSubscription _subscription;

  MenuItemCategoriesCubit({
    required MenuItemEntity menuItem,
    MenuRepository? menuRepository,
    CategoryRepository? categoryRepository,
    FirebaseFunctions? firebaseFunctions,
    FirebaseFirestore? firebaseFirestore,
    StoreCacheService? storeCacheService,
  })  : _menuItem = menuItem,
        _categoryRepository = categoryRepository ?? Locator.instance(),
        _menuRepository = menuRepository ?? Locator.instance(),
        _firebaseFunctions = firebaseFunctions ?? Locator.instance(),
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(MenuItemCategoriesState.initial());

  @override
  Future<void> close() async {
    super.close();
    _subscription.cancel();
  }

  void load() async {
    final storeId = await _storeCacheService.get('storeId');
    _subscription = _categoryRepository
        .getCategoriesForItem(
      storeId: storeId,
      item: _menuItem,
    )
        .listen((categories) {
      emit(state.copyWith(categories: categories));
    });
  }

  void removeItemFromCategory({required CategoryEntity category}) async {
    try {
      final storeId = await _storeCacheService.get('storeId');

      final updatedCategory = category.copyWith(
        itemIds: List.from(category.itemIds)..remove(_menuItem.id),
      );

      await _categoryRepository.update(
        storeId: storeId,
        resource: updatedCategory,
      );

      final menus = await _menuRepository.getAll(storeId: storeId).first;
      final menuFutures = List.generate(
        menus.length,
        (index) async {
          final menu = menus[index];
          final compiledItemRef = _firebaseFirestore.compiledMenuItemsDocument(
            storeId: storeId,
            menuId: menu.id!,
            categoryId: category.id!,
            itemId: _menuItem.id!,
          );
          final recursiveDelete =
              _firebaseFunctions.httpsCallable(Callables.recursiveDelete);
          return await recursiveDelete({'path': compiledItemRef.path});
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
      final storeId = await _storeCacheService.get('storeId');
      final updatedCategory = category.copyWith(
        itemIds: List.from(category.itemIds)..add(_menuItem.id!),
      );
      emit(state.copyWith(failure: null));
      await _categoryRepository.update(
        storeId: storeId,
        resource: updatedCategory,
      );
    } catch (err) {
      emit(state.copyWith(failure: Failure(message: err.toString())));
    }
  }
}
