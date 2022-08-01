import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'compiled_category_state.dart';
part 'compiled_category_cubit.freezed.dart';

class CompiledCategoryCubit extends Cubit<CompiledCategoryState> {
  CompiledCategoryCubit({
    CompiledMenuRepository? compiledMenuRepository,
    StoreCacheService? storeCacheService,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(CompiledCategoryState.initial());

  final CompiledMenuRepository _compiledMenuRepository;
  final StoreCacheService _storeCacheService;
  late StreamSubscription _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  Future<void> load({
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
        emit(CompiledCategoryState.success(categories: categories));
      })
        ..onError((dynamic err) {
          emit(
            CompiledCategoryState.error(
              categories: state.categories,
              exception: CustomException(message: err.toString()),
            ),
          );
        });
    } on CustomException catch (err) {
      emit(
        CompiledCategoryState.error(
          categories: state.categories,
          exception: err,
        ),
      );
    }
  }
}
