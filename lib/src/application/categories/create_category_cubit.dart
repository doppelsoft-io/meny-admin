import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'create_category_state.dart';
part 'create_category_cubit.freezed.dart';

class CreateCategoryCubit extends Cubit<CreateCategoryState> {
  CreateCategoryCubit({
    required StoreCubit storeCubit,
    CategoryRepository? categoryRepository,
  })  : _storeCubit = storeCubit,
        _categoryRepository = categoryRepository ?? Locator.instance(),
        super(CreateCategoryState.initial(category: CategoryModel.draft()));
  final CategoryRepository _categoryRepository;
  final StoreCubit _storeCubit;

  Future<void> create() async {
    emit(_Creating(category: state.category));

    try {
      final storeId = _storeCubit.state.store.id!;
      final newMenu = await _categoryRepository.create(
        storeId: storeId,
        resource: state.category.copyWith(createdAt: DateTime.now()),
      );
      emit(_Created(category: newMenu));
    } on CreateCategoryException catch (err) {
      emit(
        _Error(
          category: state.category,
          exception: err,
        ),
      );
    }
  }
}
