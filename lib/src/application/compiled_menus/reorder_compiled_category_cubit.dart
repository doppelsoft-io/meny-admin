import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'reorder_compiled_category_state.dart';
part 'reorder_compiled_category_cubit.freezed.dart';

class ReorderCompiledCategoryCubit extends Cubit<ReorderCompiledCategoryState> {
  ReorderCompiledCategoryCubit({
    MenuCategoryRepository? menuCategoryRepository,
    required StoreCubit storeCubit,
  })  : _storeCubit = storeCubit,
        _menuCategoryRepository = menuCategoryRepository ?? Locator.instance(),
        super(const ReorderCompiledCategoryState.initial());

  final StoreCubit _storeCubit;
  final MenuCategoryRepository _menuCategoryRepository;

  Future<void> reorder({
    required String menuId,
    required List<CompiledCategoryModel> categories,
  }) async {
    emit(const _Reordering());

    try {
      final storeId = _storeCubit.state.store.id!;
      final futures = List.generate(
        categories.length,
        (index) async {
          final category = categories[index];
          final menuCategory = await _menuCategoryRepository.get(
            storeId: storeId,
            menuId: menuId,
            categoryId: category.id,
          );
          return _menuCategoryRepository.update(
            storeId: storeId,
            model: menuCategory.copyWith(position: index),
          );
        },
      );
      await Future.wait(futures);

      emit(const _Success());
    } catch (err) {
      emit(
        const _Error(
          exception: CustomException(message: 'Reordering failed'),
        ),
      );
    }
  }
}
