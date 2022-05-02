import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'compiled_category_state.dart';

class CompiledCategoryCubit extends Cubit<CompiledCategoryState> {
  final CompiledMenuRepository _compiledMenuRepository;
  final StoreCacheService _storeCacheService;
  late StreamSubscription _subscription;

  CompiledCategoryCubit({
    CompiledMenuRepository? compiledMenuRepository,
    StoreCacheService? storeCacheService,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
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
      final storeId = await _storeCacheService.get('storeId');
      _subscription = _compiledMenuRepository
          .getCategoriesForMenu(
        storeId: storeId,
        menuId: menuId,
      )
          .listen((categories) {
        emit(
          state.copyWith(
            categories: categories,
            status: CompiledCategoryStatus.success,
          ),
        );
      })
        ..onError((dynamic err) {
          emit(
            state.copyWith(
              failure: Failure(message: err.toString()),
              status: CompiledCategoryStatus.error,
            ),
          );
        });
    } on Failure catch (failure) {
      emit(
        state.copyWith(
          failure: failure,
          status: CompiledCategoryStatus.error,
        ),
      );
    }
  }
}
