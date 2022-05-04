import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/menu_categories/menu_categories.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/typedefs/typedefs.dart';

part 'menu_categories_state.dart';
part 'menu_categories_cubit.freezed.dart';

class MenuCategoriesCubit extends Cubit<MenuCategoriesState> {
  MenuCategoriesCubit({
    required StoreCubit storeCubit,
    MenuRepository? menuRepository,
    MenuCategoryRepository? menuCategoryRepository,
  })  : _storeCubit = storeCubit,
        _menuCategoryRepository = menuCategoryRepository ?? Locator.instance(),
        _menuRepository = menuRepository ?? Locator.instance(),
        super(const MenuCategoriesState.initial());

  final StoreCubit _storeCubit;
  final MenuCategoryRepository _menuCategoryRepository;
  final MenuRepository _menuRepository;
  StreamSubscription? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> load({required String categoryId}) async {
    final storeId = _storeCubit.state.store.id!;
    final menus = await _menuRepository.getAll(storeId: storeId).first;

    _subscription = _menuCategoryRepository
        .streamForCategory(
      storeId: storeId,
      categoryId: categoryId,
      orderBy: const OrderBy('createdAt', false),
    )
        .listen((menuCategories) {
      syncAvailableMenus(menuCategories: menuCategories, menus: menus);
    });
  }

  Future<void> syncAvailableMenus({
    required List<MenuCategoryModel> menuCategories,
    required List<MenuModel> menus,
  }) async {
    final menuCategoryMenuIds = menuCategories.map((mc) => mc.menuId).toList();
    final menusAvailable = List<MenuModel>.from(menus)
        .where((m) => menuCategoryMenuIds.contains(m.id))
        .toList()
      ..sort((a, b) => a.createdAt!.isAfter(b.createdAt!) ? 1 : 0);

    emit(
      state.copyWith(
        menus: menusAvailable,
        menuCategories: menuCategories,
      ),
    );
  }

  Future<void> createMenuCategory({
    required MenuModel menu,
    required CategoryModel category,
  }) async {
    try {
      emit(
        MenuCategoriesState.adding(
          menuCategories: state.menuCategories,
          menus: state.menus,
        ),
      );

      final storeId = _storeCubit.state.store.id!;
      await _menuCategoryRepository.create(
        storeId: storeId,
        menuId: menu.id!,
        categoryId: category.id!,
      );

      emit(
        MenuCategoriesState.success(
          menuCategories: state.menuCategories,
          menus: state.menus,
        ),
      );
    } on CreateMenuCategoryException catch (err) {
      emit(
        MenuCategoriesState.error(
          menuCategories: state.menuCategories,
          menus: state.menus,
          exception: err,
        ),
      );
    } finally {
      emit(
        MenuCategoriesState.initial(
          menuCategories: state.menuCategories,
          menus: state.menus,
        ),
      );
    }
  }

  Future<void> removeMenuCategory({
    required MenuModel menu,
    required CategoryModel category,
  }) async {
    try {
      emit(
        MenuCategoriesState.removing(
          menuCategories: state.menuCategories,
          menus: state.menus,
        ),
      );

      final storeId = _storeCubit.state.store.id!;
      await _menuCategoryRepository.remove(
        storeId: storeId,
        menuId: menu.id!,
        categoryId: category.id!,
      );

      emit(
        MenuCategoriesState.success(
          menuCategories: state.menuCategories,
          menus: state.menus,
        ),
      );
    } on CreateMenuCategoryException catch (err) {
      emit(
        MenuCategoriesState.error(
          menuCategories: state.menuCategories,
          menus: state.menus,
          exception: err,
        ),
      );
    } finally {
      emit(
        MenuCategoriesState.initial(
          menuCategories: state.menuCategories,
          menus: state.menus,
        ),
      );
    }
  }
}
