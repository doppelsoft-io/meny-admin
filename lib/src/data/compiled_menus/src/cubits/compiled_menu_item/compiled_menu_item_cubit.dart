import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';

part 'compiled_menu_item_state.dart';

class CompiledMenuItemCubit extends Cubit<CompiledMenuItemState> {
  final CompiledMenuRepository _compiledMenuRepository;
  late StreamSubscription _subscription;
  CompiledMenuItemCubit({
    CompiledMenuRepository? compiledMenuRepository,
  })  : _compiledMenuRepository = compiledMenuRepository ?? Locator.instance(),
        super(CompiledMenuItemState.initial());

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  void load({
    required String menuId,
    required String categoryId,
  }) async {
    try {
      _subscription = _compiledMenuRepository
          .getItemsForCategory(menuId: menuId, categoryId: categoryId)
          .listen((items) {
        emit(
          state.copyWith(
            items: items,
            status: CompiledMenuItemStatus.success,
          ),
        );
      })
        ..onError((err) {
          emit(state.copyWith(
            failure: Failure(message: err.toString()),
            status: CompiledMenuItemStatus.error,
          ));
        });
    } on Failure catch (failure) {
      emit(state.copyWith(
        failure: failure,
        status: CompiledMenuItemStatus.error,
      ));
    }
  }
}
