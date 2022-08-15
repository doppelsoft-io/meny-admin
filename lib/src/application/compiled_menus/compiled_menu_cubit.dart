import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'compiled_menu_state.dart';
part 'compiled_menu_cubit.freezed.dart';

class CompiledMenuCubit extends Cubit<CompiledMenuState> {
  CompiledMenuCubit({
    required StoreCubit storeCubit,
    MenuRepository? menuRepository,
    CategoryRepository? categoryRepository,
    MenuItemRepository? menuItemRepository,
    MenuCategoryRepository? menuCategoryRepository,
    CategoryMenuItemsRepository? categoryMenuItemsRepository,
    CompiledMenuRepository? compiledMenuRepository,
  })  : _storeCubit = storeCubit,
        _menuRepository = menuRepository ?? Locator.instance(),
        _categoryRepository = categoryRepository ?? Locator.instance(),
        _menuItemRepository = menuItemRepository ?? Locator.instance(),
        _menuCategoryRepository = menuCategoryRepository ?? Locator.instance(),
        _categoryMenuItemsRepository =
            categoryMenuItemsRepository ?? Locator.instance(),
        _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        super(_Loading(response: CompiledMenuModel.empty()));

  final StoreCubit _storeCubit;
  final MenuRepository _menuRepository;
  final CategoryRepository _categoryRepository;
  final MenuItemRepository _menuItemRepository;
  final MenuCategoryRepository _menuCategoryRepository;
  final CategoryMenuItemsRepository _categoryMenuItemsRepository;
  final CompiledMenuRepository _compiledMenuRepository;

  Future<void> load({required String id}) async {
    try {
      final storeId = _storeCubit.state.store.id!;
      final menu = await _menuRepository.get(storeId: storeId, id: id);
      final compiledMenu = CompiledMenuModel(
        id: menu.id!,
        name: menu.name,
        description: menu.description,
      );
      final menuCategories = await _menuCategoryRepository.getForMenu(
        storeId: storeId,
        menuId: menu.id!,
        orderBy: const OrderBy('position'),
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
          final compiledCategory = CompiledCategoryModel(
            id: category.id!,
            name: category.name,
            position: index,
            items: List.generate(menuItems.length, (i) {
              final item = menuItems[i];
              return CompiledMenuItemModel(
                id: item.id!,
                name: item.name,
                position: i,
                description: item.description,
                priceInfo: item.priceInfo,
                suspensionRules: item.suspensionRules,
                imageUrl: item.imageUrl,
                dietaryLabels: item.dietaryLabels,
              );
            }),
          );

          return compiledCategory;
        },
      );

      final compiledCategories = await Future.wait(categoryFutures);

      final updatedCompiledMenu = compiledMenu.copyWith(
        categories: compiledCategories,
      );

      emit(
        _Loaded(
          response: updatedCompiledMenu,
        ),
      );
    } on CustomException catch (failure) {
      emit(
        _Error(
          response: state.response,
          exception: failure,
        ),
      );
    }
  }

  void syncCategories(List<CompiledCategoryModel> categories) {
    emit(
      state.copyWith(
        response: state.response.copyWith(
          categories: categories,
        ),
      ),
    );
  }

  Future<void> publish() async {
    try {
      emit(_Publishing(response: state.response));
      final storeId = _storeCubit.state.store.id!;
      await _compiledMenuRepository.publish(
        storeId: storeId,
        menu: state.response,
      );
      emit(_Published(response: state.response));
    } on CustomException catch (err) {
      emit(
        _Error(
          response: state.response,
          exception: err,
        ),
      );
    }
  }
}
