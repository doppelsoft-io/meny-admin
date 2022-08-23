import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'reorder_compiled_menu_item_state.dart';
part 'reorder_compiled_menu_item_cubit.freezed.dart';

class ReorderCompiledMenuItemCubit extends Cubit<ReorderCompiledMenuItemState> {
  ReorderCompiledMenuItemCubit({
    required StoreCubit storeCubit,
    CategoryMenuItemsRepository? categoryMenuItemsRepository,
  })  : _storeCubit = storeCubit,
        _categoryMenuItemsRepository =
            categoryMenuItemsRepository ?? Locator.instance(),
        super(const _Initial());

  final StoreCubit _storeCubit;
  final CategoryMenuItemsRepository _categoryMenuItemsRepository;

  Future<void> reorder({
    required CompiledCategoryModel category,
    required List<CompiledMenuItemModel> items,
  }) async {
    emit(const ReorderCompiledMenuItemState.reordering());

    try {
      final storeId = _storeCubit.state.store.id!;
      final futures = List.generate(
        items.length,
        (index) async {
          final item = items[index];
          final categoryMenuItem = await _categoryMenuItemsRepository.get(
            storeId: storeId,
            categoryId: category.id,
            menuItemId: item.id,
          );

          return _categoryMenuItemsRepository.update(
            storeId: storeId,
            model: categoryMenuItem.copyWith(position: index),
          );
        },
      );
      await Future.wait(futures);

      emit(const ReorderCompiledMenuItemState.success());
    } catch (err) {
      emit(
        const ReorderCompiledMenuItemState.error(
          exception: CustomException(message: 'Reordering items failed.'),
        ),
      );
    }
  }
}
