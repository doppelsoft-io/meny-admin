import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'create_menu_state.dart';
part 'create_menu_cubit.freezed.dart';

class CreateMenuCubit extends Cubit<CreateMenuState> {
  CreateMenuCubit({
    required StoreCubit storeCubit,
    MenuRepository? menuRepository,
  })  : _storeCubit = storeCubit,
        _menuRepository = menuRepository ?? Locator.instance(),
        super(CreateMenuState.initial(menu: MenuModel.draft()));

  final MenuRepository _menuRepository;
  final StoreCubit _storeCubit;

  Future<void> create() async {
    emit(_Creating(menu: state.menu));

    try {
      final storeId = _storeCubit.state.store.id!;
      final newMenu = await _menuRepository.create(
        storeId: storeId,
        resource: state.menu.copyWith(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      emit(_Created(menu: newMenu));
    } on CreateMenuException catch (err) {
      emit(
        _Error(
          menu: state.menu,
          exception: err,
        ),
      );
    }
  }
}
