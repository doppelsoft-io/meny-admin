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

part 'category_menus_state.dart';

class CategoryMenusCubit extends Cubit<CategoryMenusState> {
  final CategoryEntity _category;
  final MenuRepository _menuRepository;
  final FirebaseFunctions _firebaseFunctions;

  late StreamSubscription _subscription;

  CategoryMenusCubit({
    required CategoryEntity category,
    MenuRepository? menuRepository,
    FirebaseFunctions? firebaseFunctions,
  })  : _category = category,
        _menuRepository = menuRepository ?? Locator.instance(),
        _firebaseFunctions = firebaseFunctions ?? Locator.instance(),
        super(CategoryMenusState.initial()) {
    _subscription = _menuRepository
        .getMenusForCategory(category: _category)
        .listen((menus) {
      emit(state.copyWith(menus: menus));
    });
  }

  @override
  Future<void> close() async {
    super.close();
    _subscription.cancel();
  }

  void removeCategoryFromMenu({required MenuEntity menu}) async {
    try {
      final updatedCategory = menu.copyWith(
        categoryIds: List.from(menu.categoryIds)..remove(_category.id),
      );
      await _menuRepository.update(resource: updatedCategory);

      final recursiveDelete =
          _firebaseFunctions.httpsCallable(Callables.recursiveDelete);
      final path =
          '${Paths.menus}/${menu.id}/${Paths.categories}/${_category.id}';

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
      await _menuRepository.update(resource: updatedCategory);
      emit(state.copyWith(failure: null));
    } catch (err) {
      emit(state.copyWith(failure: Failure(message: err.toString())));
    }
  }
}
