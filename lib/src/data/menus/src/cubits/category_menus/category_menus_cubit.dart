import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/callables.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'category_menus_state.dart';

class CategoryMenusCubit extends Cubit<CategoryMenusState> {
  final CategoryEntity _category;
  final MenuRepository _menuRepository;
  final FirebaseFunctions _firebaseFunctions;
  final StoreCacheService _storeCacheService;

  late StreamSubscription _subscription;

  CategoryMenusCubit({
    required CategoryEntity category,
    MenuRepository? menuRepository,
    FirebaseFunctions? firebaseFunctions,
    StoreCacheService? storeCacheService,
  })  : _category = category,
        _menuRepository = menuRepository ?? Locator.instance(),
        _firebaseFunctions = firebaseFunctions ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(CategoryMenusState.initial());

  @override
  Future<void> close() async {
    super.close();
    _subscription.cancel();
  }

  void load() async {
    final storeId = await _storeCacheService.get('storeId');

    _subscription = _menuRepository
        .getMenusForCategory(
      storeId: storeId,
      category: _category,
    )
        .listen((menus) {
      emit(state.copyWith(menus: menus));
    });
  }

  void removeCategoryFromMenu({required MenuEntity menu}) async {
    try {
      final updatedCategory = menu.copyWith(
        categoryIds: List.from(menu.categoryIds)..remove(_category.id),
      );
      final storeId = await _storeCacheService.get('storeId');
      await _menuRepository.update(
        storeId: storeId,
        resource: updatedCategory,
      );

      final recursiveDelete =
          _firebaseFunctions.httpsCallable(Callables.recursiveDelete);

      final path =
          '${Paths.stores}/$storeId{Paths.menus}/${menu.id}/${Paths.categories}/${_category.id}';

      await recursiveDelete({'path': path});
      emit(state.copyWith(failure: null));
    } catch (err) {
      emit(state.copyWith(failure: Failure(message: err.toString())));
    }
  }

  void addCategoryToMenu({required MenuEntity menu}) async {
    try {
      final updatedCategory = menu.copyWith(
        categoryIds: List<String>.from(menu.categoryIds)..add(_category.id!),
      );
      final storeId = await _storeCacheService.get('storeId');
      await _menuRepository.update(
        storeId: storeId,
        resource: updatedCategory,
      );
      emit(state.copyWith(failure: null));
    } catch (err) {
      emit(state.copyWith(failure: Failure(message: err.toString())));
    }
  }
}
