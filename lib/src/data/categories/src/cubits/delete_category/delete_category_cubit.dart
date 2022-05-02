import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/cubits/cubits.dart';
import 'package:meny/src/extensions/extensions.dart';

part 'delete_category_cubit.freezed.dart';
part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit({
    required StoreCubit storeCubit,
    FirebaseFirestore? firebaseFirestore,
  })  : _storeCubit = storeCubit,
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        super(DeleteCategoryState.initial());

  final FirebaseFirestore _firebaseFirestore;
  final StoreCubit _storeCubit;

  void delete({
    required CategoryModel category,
    required List<MenuModel> menus,
  }) async {
    emit(DeleteCategoryState.deleting());

    try {
      final batch = _firebaseFirestore.batch();
      final storeId = _storeCubit.state.store!.id!;
      final categoryRef = _firebaseFirestore.categoryEntitiesDocument(
        storeId: storeId,
        categoryId: category.id!,
      );
      batch.delete(categoryRef);

      /// Delete menu_categories associated with category
      for (final menu in menus) {
        final docId = '${menu.id}-${category.id}';

        final menuCategoryRef = _firebaseFirestore
            .collection(Paths.stores)
            .doc(storeId)
            .collection(Paths.menuCategories)
            .doc(docId);

        batch.delete(menuCategoryRef);
      }

      await batch.commit();

      emit(DeleteCategoryState.success());
    } catch (err) {
      emit(
        DeleteCategoryState.error(
          exception: Failure(message: 'Failed to delete category'),
        ),
      );
    } finally {
      emit(DeleteCategoryState.initial());
    }
  }
}
