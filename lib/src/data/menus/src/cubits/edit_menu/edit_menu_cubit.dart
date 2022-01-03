import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/enums/enums.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';

part 'edit_menu_state.dart';

class EditMenuCubit extends Cubit<EditMenuState> {
  final MenuRepository _menuRepository;
  final StoreCacheService _storeCacheService;

  EditMenuCubit({
    MenuRepository? menuRepository,
    StoreCacheService? storeCacheService,
  })  : _menuRepository = menuRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(EditMenuState.initial());

  void loadMenu({required MenuEntity menu}) async {
    if (menu.id != null && menu.id!.isNotEmpty) {
      emit(state.copyWith(menu: menu));
    } else {
      final storeId = await _storeCacheService.get('storeId');
      final failureOrMenu = await _menuRepository.create(
        storeId: storeId,
        resource: menu,
      );
      failureOrMenu.fold(
        (failure) => emit(state.copyWith(failure: failure)),
        (menu) => emit(state.copyWith(menu: menu, failure: null)),
      );
    }
  }

  void update(MenuEntity item) async {
    emit(state.copyWith(status: EditResourceStatus.updating));
    final storeId = await _storeCacheService.get('storeId');
    final failureOrUpdate = await _menuRepository.update(
      storeId: storeId,
      resource: item,
    );
    failureOrUpdate.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        status: EditResourceStatus.error,
      )),
      (update) => emit(state.copyWith(
        status: EditResourceStatus.success,
        failure: null,
      )),
    );
  }
}
