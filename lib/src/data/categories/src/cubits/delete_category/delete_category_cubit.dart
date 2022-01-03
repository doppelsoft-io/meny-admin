import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/callables.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/services/services.dart';
import 'package:meny/src/extensions/extensions.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  final FirebaseFirestore _firebaseFirestore;
  final StoreCacheService _storeCacheService;

  DeleteCategoryCubit({
    FirebaseFirestore? firebaseFirestore,
    StoreCacheService? storeCacheService,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(DeleteCategoryState.initial());

  void delete({
    required CategoryEntity category,
    required List<MenuEntity> menus,
  }) async {
    emit(state.copyWith(
      status: DeleteCategoryStatus.deleting,
      failure: null,
    ));

    try {
      final batch = _firebaseFirestore.batch();
      final storeId = await _storeCacheService.get('storeId');
      final categoryRef = _firebaseFirestore.categoryEntitiesDocument(
        storeId: storeId,
        categoryId: category.id!,
      );
      batch.delete(categoryRef);

      final menuFutures = List.generate(
        menus.length,
        (index) async {
          final menu = menus[index];
          final updatedMenu = menu.copyWith(
            categoryIds: List.from(menu.categoryIds)..remove(category.id),
          );

          final menuRef = _firebaseFirestore.menuEntitiesDocument(
            storeId: storeId,
            menuId: menu.id!,
          );
          batch.update(menuRef, updatedMenu.toJson());

          final categoryRef = _firebaseFirestore.compiledCategoriesDocument(
            storeId: storeId,
            menuId: menu.id!,
            categoryId: category.id!,
          );

          final categoryDoc = await categoryRef.get();

          if (categoryDoc.exists) {
            final recursiveDelete = FirebaseFunctions.instance
                .httpsCallable(Callables.recursiveDelete);
            return await recursiveDelete({'path': categoryRef.path});
          }
        },
      );

      await Future.wait(menuFutures);

      await batch.commit();

      emit(
        state.copyWith(
          status: DeleteCategoryStatus.success,
          failure: null,
        ),
      );
    } on FirebaseFunctionsException catch (_) {
      emit(
        state.copyWith(
          status: DeleteCategoryStatus.error,
          failure: Failure(
            message: 'Deleting category failed.',
          ),
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(
          status: DeleteCategoryStatus.error,
          failure: Failure(
            message: 'Deleting category failed.',
          ),
        ),
      );
    }
  }
}
