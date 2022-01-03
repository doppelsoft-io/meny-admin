import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/services/services.dart';

part 'compiled_menu_state.dart';

class CompiledMenuCubit extends Cubit<CompiledMenuState> {
  final MenuRepository _menuRepository;
  final StoreCacheService _storeCacheService;

  CompiledMenuCubit({
    MenuRepository? menuRepository,
    StoreCacheService? storeCacheService,
  })  : _menuRepository = menuRepository ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(CompiledMenuState.initial());

  void load({required MenuEntity menu}) async {
    try {
      final storeId = await _storeCacheService.get('storeId');
      final menuEntity = await _menuRepository.get(
        storeId: storeId,
        id: menu.id!,
      );
      emit(state.copyWith(
        menu: menuEntity,
        status: CompiledMenuStatus.success,
      ));
    } on Failure catch (failure) {
      emit(state.copyWith(
        failure: failure,
        status: CompiledMenuStatus.error,
      ));
    }
  }
}
