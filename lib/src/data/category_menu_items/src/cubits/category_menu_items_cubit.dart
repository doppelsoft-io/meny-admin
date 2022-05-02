import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/category_menu_items/category_menu_items.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/cubits/cubits.dart';

part 'category_menu_items_state.dart';
part 'category_menu_items_cubit.freezed.dart';

class CategoryMenuItemsCubit extends Cubit<CategoryMenuItemsState> {
  CategoryMenuItemsCubit({
    required StoreCubit storeCubit,
    CategoryMenuItemsRepository? categoryMenuItemsRepository,
    CategoryRepository? categoryRepository,
  })  : _storeCubit = storeCubit,
        _categoryMenuItemsRepository =
            categoryMenuItemsRepository ?? Locator.instance(),
        _categoryRepository = categoryRepository ?? Locator.instance(),
        super(CategoryMenuItemsState.initial());

  final StoreCubit _storeCubit;
  final CategoryMenuItemsRepository _categoryMenuItemsRepository;
  final CategoryRepository _categoryRepository;
  StreamSubscription? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    super.close();
  }

  void load({required String menuItemId}) async {
    final storeId = _storeCubit.state.store!.id!;
    final categories = await _categoryRepository.getAll(storeId: storeId).first;

    _subscription = _categoryMenuItemsRepository
        .streamForMenuItem(
      storeId: storeId,
      menuItemId: menuItemId,
    )
        .listen((categoryMenuItems) {
      syncAvailableCategories(
        categoryMenuItems: categoryMenuItems,
        categories: categories,
      );
    });
  }

  Future<void> syncAvailableCategories({
    required List<CategoryMenuItemModel> categoryMenuItems,
    required List<CategoryModel> categories,
  }) async {
    final categoryMenuItemIds =
        categoryMenuItems.map((cmi) => cmi.categoryId).toList();
    final categoriesAvailable = List<CategoryModel>.from(categories)
        .where((c) => categoryMenuItemIds.contains(c.id))
        .toList();

    emit(state.copyWith(
      categories: categoriesAvailable,
      categoryMenuItems: categoryMenuItems,
    ));
  }

  Future<void> createCategoryMenuItem({
    required CategoryModel category,
    required MenuItemModel item,
  }) async {
    try {
      emit(CategoryMenuItemsState.adding(
        categoryMenuItems: state.categoryMenuItems,
        categories: state.categories,
      ));

      final storeId = _storeCubit.state.store!.id!;

      await _categoryMenuItemsRepository.create(
        storeId: storeId,
        categoryId: category.id!,
        menuItemId: item.id!,
      );

      emit(CategoryMenuItemsState.success(
        categoryMenuItems: state.categoryMenuItems,
        categories: state.categories,
      ));
    } on CreateCategoryMenuItemException catch (err) {
      emit(CategoryMenuItemsState.error(
        categoryMenuItems: state.categoryMenuItems,
        categories: state.categories,
        exception: err,
      ));
    }
  }

  Future<void> removeMenuCategory({
    required CategoryModel category,
    required MenuItemModel item,
  }) async {
    try {
      emit(CategoryMenuItemsState.removing(
        categoryMenuItems: state.categoryMenuItems,
        categories: state.categories,
      ));

      final storeId = _storeCubit.state.store!.id!;
      await _categoryMenuItemsRepository.remove(
        storeId: storeId,
        categoryId: category.id!,
        menuItemId: item.id!,
      );

      emit(CategoryMenuItemsState.success(
        categoryMenuItems: state.categoryMenuItems,
        categories: state.categories,
      ));
    } on CreateCategoryMenuItemException catch (err) {
      emit(CategoryMenuItemsState.error(
        categoryMenuItems: state.categoryMenuItems,
        categories: state.categories,
        exception: err,
      ));
    }
  }
}
