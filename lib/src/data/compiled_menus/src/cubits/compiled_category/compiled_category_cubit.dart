import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';

part 'compiled_category_state.dart';

class CompiledCategoryCubit extends Cubit<CompiledCategoryState> {
  final CompiledMenuRepository _compiledMenuRepository;
  late StreamSubscription _subscription;

  CompiledCategoryCubit({
    CompiledMenuRepository? compiledMenuRepository,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        super(CompiledCategoryState.initial());

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  void load({
    required String menuId,
  }) async {
    try {
      _subscription = _compiledMenuRepository
          .getCategoriesForMenu(
        menuId: menuId,
      )
          .listen((categories) {
        emit(state.copyWith(
          categories: categories,
          status: CompiledCategoryStatus.success,
        ));
      })
        ..onError((err) {
          emit(state.copyWith(
            failure: Failure(message: err.toString()),
            status: CompiledCategoryStatus.error,
          ));
        });
    } on Failure catch (failure) {
      emit(state.copyWith(
        failure: failure,
        status: CompiledCategoryStatus.error,
      ));
    }
  }
}
