import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/callables.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  final FirebaseFirestore _firebaseFirestore;
  DeleteCategoryCubit({
    FirebaseFirestore? firebaseFirestore,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
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
      final menuItemRef =
          _firebaseFirestore.collection(Paths.categories).doc(category.id);
      batch.delete(menuItemRef);

      final menuFutures = List.generate(
        menus.length,
        (index) async {
          final menu = menus[index];
          final updatedMenu = menu.copyWith(
            categoryIds: List.from(menu.categoryIds)..remove(category.id),
          );

          final menuRef =
              _firebaseFirestore.collection(Paths.menus).doc(menu.id);
          batch.update(menuRef, updatedMenu.toJson());

          final categoryRef = _firebaseFirestore
              .collection(Paths.menus)
              .doc(menu.id)
              .collection(Paths.categories)
              .doc(category.id);
          final categoryDoc = await categoryRef.get();
          if (categoryDoc.exists) {
            final recursiveDelete = FirebaseFunctions.instance
                .httpsCallable(Callables.recursiveDelete);
            final path =
                '${Paths.menus}/${menu.id}/${Paths.categories}/${category.id}';
            return await recursiveDelete({'path': path});
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
