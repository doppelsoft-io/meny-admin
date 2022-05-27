import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/categories/categories.dart';
import 'package:meny_admin/src/data/category_menu_items/category_menu_items.dart';
import 'package:meny_admin/src/data/core/failures.dart';
import 'package:meny_admin/src/data/menu_categories/menu_categories.dart';
import 'package:meny_admin/src/data/menu_items/menu_items.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/typedefs/typedefs.dart';
import 'package:meny_core/meny_core.dart';

part 'compiled_menu_state.dart';
part 'compiled_menu_cubit.freezed.dart';

class CompiledMenuCubit extends Cubit<CompiledMenuState> {
  CompiledMenuCubit({
    required StoreCubit storeCubit,
    CategoryRepository? categoryRepository,
    MenuItemRepository? menuItemRepository,
    MenuCategoryRepository? menuCategoryRepository,
    CategoryMenuItemsRepository? categoryMenuItemsRepository,
  })  : _storeCubit = storeCubit,
        _categoryRepository = categoryRepository ?? Locator.instance(),
        _menuItemRepository = menuItemRepository ?? Locator.instance(),
        _menuCategoryRepository = menuCategoryRepository ?? Locator.instance(),
        _categoryMenuItemsRepository =
            categoryMenuItemsRepository ?? Locator.instance(),
        super(
          CompiledMenuState.loading(
            response: MenuResponse(MenuModel.empty(), <CategoryMenuItemMap>[]),
          ),
        );

  final StoreCubit _storeCubit;
  final CategoryRepository _categoryRepository;
  final MenuItemRepository _menuItemRepository;
  final MenuCategoryRepository _menuCategoryRepository;
  final CategoryMenuItemsRepository _categoryMenuItemsRepository;

  Future<void> load({required MenuModel menu}) async {
    try {
      final storeId = _storeCubit.state.store.id!;
      final menuCategories = await _menuCategoryRepository.getForMenu(
        storeId: storeId,
        menuId: menu.id!,
        orderBy: const OrderBy('position', false),
      );
      final categoryFutures = List.generate(
        menuCategories.length,
        (index) async {
          final categoryId = menuCategories[index].categoryId;
          final category = await _categoryRepository.get(
            storeId: storeId,
            id: categoryId,
          );

          final categoryMenuItems =
              await _categoryMenuItemsRepository.getForCategory(
            storeId: storeId,
            categoryId: categoryId,
          )
                ..sort((a, b) {
                  return (a.position ?? 1000).compareTo(b.position ?? 999);
                });

          final categoryMenuItemFutures = List.generate(
            categoryMenuItems.length,
            (index) async {
              final menuItemId = categoryMenuItems[index].menuItemId;
              final menuItem = await _menuItemRepository.get(
                storeId: storeId,
                id: menuItemId,
              );
              return menuItem;
            },
          );

          final menuItems = await Future.wait(categoryMenuItemFutures);

          return CategoryMenuItemMap(category, menuItems);
        },
      );

      final categoryItemMaps = await Future.wait(categoryFutures);

      emit(
        CompiledMenuState.loaded(
          response: MenuResponse(menu, categoryItemMaps),
        ),
      );
    } on Failure catch (failure) {
      emit(
        CompiledMenuState.error(
          response: state.response,
          exception: failure,
        ),
      );
    }
  }
}
