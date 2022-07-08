import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/menu_items/menu_items.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_core/meny_core.dart';

part 'create_menu_item_cubit.freezed.dart';
part 'create_menu_item_state.dart';

class CreateMenuItemCubit extends Cubit<CreateMenuItemState> {
  CreateMenuItemCubit({
    MenuItemRepository? menuItemRepository,
    required StoreCubit storeCubit,
  })  : _menuItemRepository = menuItemRepository ?? Locator.instance(),
        _storeCubit = storeCubit,
        super(_Initial(item: MenuItemModel.empty()));

  final MenuItemRepository _menuItemRepository;
  final StoreCubit _storeCubit;

  Future<void> create() async {
    emit(_Creating(item: state.item));

    try {
      final storeId = _storeCubit.state.store.id!;
      final item = await _menuItemRepository.create(
        storeId: storeId,
        resource: state.item.copyWith(createdAt: DateTime.now()),
      );
      emit(_Created(item: item));
    } on CreateMenuItemException catch (err) {
      emit(
        _Error(
          item: state.item,
          exception: err,
        ),
      );
    }
  }
}
