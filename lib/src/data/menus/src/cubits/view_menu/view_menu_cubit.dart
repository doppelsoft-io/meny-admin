import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';

part 'view_menu_state.dart';

class ViewMenuCubit extends Cubit<ViewMenuState> {
  final MenuRepository _menuRepository;
  final CompiledMenuRepository _compiledMenuRepository;
  final CategoryRepository _categoryRepository;
  final MenuItemRepository _menuItemRepository;

  ViewMenuCubit({
    MenuRepository? menuRepository,
    CompiledMenuRepository? compiledMenuRepository,
    CategoryRepository? categoryRepository,
    MenuItemRepository? menuItemRepository,
  })  : _menuRepository = menuRepository ?? Locator.instance(),
        _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        _categoryRepository = categoryRepository ?? Locator.instance(),
        _menuItemRepository = menuItemRepository ?? Locator.instance(),
        super(ViewMenuState.initial());

  Future<void> _compileMenuItems({
    required int index,
    required MenuItemEntity menuItemEntity,
    required String menuId,
    required String categoryId,
    required String menuItemId,
  }) async {
    try {
      final menuItemModel = (await _compiledMenuRepository.getMenuItem(
        menuId: menuId,
        menuItemId: menuItemId,
        categoryId: categoryId,
      ))
          .mergeWithEntity(menuItemEntity);
      await _compiledMenuRepository.updateMenuItem(
        menuId: menuId,
        categoryId: categoryId,
        item: menuItemModel,
      );
    } on MenuItemDoesNotExistException catch (_) {
      final menuItemModel = MenuItemModel.fromEntity(menuItemEntity);

      await _compiledMenuRepository.updateMenuItem(
        menuId: menuId,
        categoryId: categoryId,
        item: menuItemModel,
      );
    } on Failure catch (_) {
      rethrow;
    } catch (err) {
      throw Failure(message: 'Something went wrong');
    }
  }

  void compile({required String menuId}) async {
    try {
      final menuEntity = await _menuRepository.get(id: menuId);
      final categoryIds =
          menuEntity.categoryIds.where((e) => e.isNotEmpty).toList();
      final categories = List.generate(
        categoryIds.length,
        (index) async {
          final categoryId = categoryIds[index];
          final categoryEntity = await _categoryRepository.get(id: categoryId);
          try {
            final categoryModel = (await _compiledMenuRepository.getCategory(
              menuId: menuId,
              categoryId: categoryId,
            ))
                .mergeWithEntity(categoryEntity);
            await _compiledMenuRepository.updateCategory(
              menuId: menuId,
              category: categoryModel,
            );
            final menuItemIds =
                (categoryModel.itemIds).where((e) => e.isNotEmpty).toList();

            final menuItems = List.generate(
              menuItemIds.length,
              (index) async {
                final menuItemId = menuItemIds[index];
                final menuItemEntity =
                    await _menuItemRepository.get(id: menuItemId);

                await _compileMenuItems(
                  index: index,
                  menuItemEntity: menuItemEntity,
                  menuId: menuId,
                  categoryId: categoryId,
                  menuItemId: menuItemId,
                );
              },
            );
            await Future.wait(menuItems);
          } on CategoryDoesNotExistException catch (_) {
            final categoryModel = CategoryModel.fromEntity(categoryEntity);

            await _compiledMenuRepository.updateCategory(
              menuId: menuId,
              category: categoryModel,
            );

            final menuItemIds =
                (categoryModel.itemIds).where((e) => e.isNotEmpty).toList();

            final menuItems = List.generate(
              menuItemIds.length,
              (index) async {
                final menuItemId = menuItemIds[index];
                final menuItemEntity =
                    await _menuItemRepository.get(id: menuItemId);

                await _compileMenuItems(
                  index: index,
                  menuItemEntity: menuItemEntity,
                  menuId: menuId,
                  categoryId: categoryId,
                  menuItemId: menuItemId,
                );
              },
            );
            await Future.wait(menuItems);
          } on Failure catch (_) {
            rethrow;
          } catch (err) {
            throw Failure(message: 'Something went wrong');
          }
        },
      );

      await Future.wait(categories);
    } catch (err) {
      emit(state.copyWith());
    }
    emit(state.copyWith(menu: MenuModel.empty().copyWith(id: menuId)));
  }
}
