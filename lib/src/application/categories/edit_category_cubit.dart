import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'edit_category_cubit.freezed.dart';
part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  EditCategoryCubit({
    required StoreCubit storeCubit,
    CategoryRepository? categoryRepository,
  })  : _storeCubit = storeCubit,
        _categoryRepository = categoryRepository ?? Locator.instance(),
        super(_Loading(category: CategoryModel.empty()));

  final CategoryRepository _categoryRepository;
  final StoreCubit _storeCubit;

  Future<void> loadCategory({required String id}) async {
    emit(_Loading(category: state.category));
    try {
      final storeId = _storeCubit.state.store.id!;
      final category = await _categoryRepository.get(
        storeId: storeId,
        id: id,
      );
      emit(_Loaded(category: category));
    } on GetCategoryException catch (err) {
      emit(
        _Error(
          category: state.category,
          exception: err,
        ),
      );
    }
  }

  Future<void> update(CategoryModel item) async {
    emit(_Updating(category: state.category));

    try {
      final storeId = _storeCubit.state.store.id!;

      await _categoryRepository.update(
        storeId: storeId,
        resource: item,
      );
      emit(_Success(category: state.category));
    } on UpdateCategoryException catch (err) {
      emit(
        _Error(
          category: state.category,
          exception: err,
        ),
      );
    }
  }
}
