import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_menu_item_state.dart';
part 'edit_menu_item_cubit.freezed.dart';

class EditMenuItemCubit extends Cubit<EditMenuItemState> {
  EditMenuItemCubit({
    MenuItemRepository? menuItemRepository,
    required String itemId,
    required StoreCubit storeCubit,
  })  : _itemId = itemId,
        _menuItemRepository = menuItemRepository ?? Locator.instance(),
        _storeCubit = storeCubit,
        super(_Loading(item: MenuItemModel.empty())) {
    _subscription?.cancel();

    /// If store already loaded (when already in app)
    _storeCubit.state.maybeWhen(
      loaded: (store) {
        loadItem(id: _itemId);
      },
      orElse: () {
        /// Otherwise, listen to store stream (reloads page)
        _subscription = _storeCubit.stream.listen((state) {
          state.maybeWhen(
            loaded: (store) {
              loadItem(id: _itemId);
            },
            orElse: () {},
          );
        });
      },
    );
  }

  final String _itemId;
  final StoreCubit _storeCubit;
  final MenuItemRepository _menuItemRepository;
  StreamSubscription<StoreState>? _subscription;

  Future<void> loadItem({required String id}) async {
    try {
      final storeId = _storeCubit.state.store.id!;
      final newItem = await _menuItemRepository.get(
        storeId: storeId,
        id: id,
      );
      emit(_Loaded(item: newItem));
    } on CreateMenuItemException catch (err) {
      emit(
        _Error(
          item: state.item,
          exception: err,
        ),
      );
    }
  }

  Future<void> update(MenuItemModel item, {bool save = true}) async {
    emit(_Updating(item: item));

    try {
      final storeId = _storeCubit.state.store.id!;
      if (save) {
        await _menuItemRepository.update(
          storeId: storeId,
          resource: item.copyWith(updatedAt: DateTime.now()),
        );
        emit(_Success(item: item));
      } else {
        emit(_Loaded(item: item));
      }
    } on UpdateMenuItemException catch (err) {
      emit(
        _Error(
          item: item,
          exception: err,
        ),
      );
    }
  }
}
