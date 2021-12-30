import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';

part 'compiled_menu_state.dart';

class CompiledMenuCubit extends Cubit<CompiledMenuState> {
  final MenuRepository _menuRepository;
  CompiledMenuCubit({
    MenuRepository? menuRepository,
  })  : _menuRepository = menuRepository ?? Locator.instance(),
        super(CompiledMenuState.initial());

  void load({required MenuEntity menu}) async {
    try {
      final menuEntity = await _menuRepository.get(id: menu.id!);
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
