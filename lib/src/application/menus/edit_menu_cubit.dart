import 'dart:async';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_menu_cubit.freezed.dart';
part 'edit_menu_state.dart';

class EditMenuCubit extends Cubit<EditMenuState> {
  EditMenuCubit({
    required StoreCubit storeCubit,
    required String menuId,
    MenuRepository? menuRepository,
  })  : _storeCubit = storeCubit,
        _menuId = menuId,
        _menuRepository = menuRepository ?? Locator.instance(),
        super(_Initial(menu: MenuModel.empty())) {
    _subscription?.cancel();

    /// If store already loaded (when already in app)
    _storeCubit.state.maybeWhen(
      loaded: (store) {
        loadMenu(id: _menuId);
      },
      orElse: () {
        /// Otherwise, listen to store stream (reloads page)
        _subscription = _storeCubit.stream.listen((state) {
          state.maybeWhen(
            loaded: (store) {
              loadMenu(id: _menuId);
            },
            orElse: () {},
          );
        });
      },
    );
  }

  final StoreCubit _storeCubit;
  final String _menuId;
  final MenuRepository _menuRepository;

  StreamSubscription<StoreState>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> loadMenu({required String id}) async {
    emit(_Loading(menu: state.menu));
    try {
      final storeId = _storeCubit.state.store.id!;
      final menu = await _menuRepository.get(
        storeId: storeId,
        id: id,
      );
      emit(_Loaded(menu: menu));
    } on GetMenuException catch (err) {
      emit(
        _Error(
          menu: state.menu,
          exception: err,
        ),
      );
    }
  }

  Future<void> update(MenuModel item) async {
    emit(_Updating(menu: state.menu));

    try {
      final storeId = _storeCubit.state.store.id!;
      await _menuRepository.update(
        storeId: storeId,
        resource: item,
      );

      emit(_Success(menu: state.menu));
    } on UpdateMenuException catch (err) {
      emit(_Error(menu: state.menu, exception: err));
    }
  }
}
