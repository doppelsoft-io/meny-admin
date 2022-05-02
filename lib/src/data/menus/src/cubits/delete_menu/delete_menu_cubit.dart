import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_categories/menu_categories.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/extensions/extensions.dart';

part 'delete_menu_state.dart';
part 'delete_menu_cubit.freezed.dart';

class DeleteMenuCubit extends Cubit<DeleteMenuState> {
  final FirebaseFirestore _firebaseFirestore;
  final StoreCubit _storeCubit;
  final MenuCategoryRepository _menuCategoryRepository;

  DeleteMenuCubit({
    required StoreCubit storeCubit,
    FirebaseFirestore? firebaseFirestore,
    MenuCategoryRepository? menuCategoryRepository,
  })  : _storeCubit = storeCubit,
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _menuCategoryRepository = menuCategoryRepository ?? Locator.instance(),
        super(DeleteMenuState.initial());

  Future<void> delete({required MenuModel menu}) async {
    emit(DeleteMenuState.deleting());

    try {
      final storeId = _storeCubit.state.store!.id!;
      final batch = _firebaseFirestore.batch();
      final menuRef = _firebaseFirestore.menuEntitiesDocument(
        storeId: storeId,
        menuId: menu.id!,
      );

      batch.delete(menuRef);

      final menuCategories = await _menuCategoryRepository.getForMenu(
        storeId: storeId,
        menuId: menu.id!,
      );

      for (final menuCategory in menuCategories) {
        final docId = '${menu.id}-${menuCategory.categoryId}';
        final menuCategoryRef = _firebaseFirestore
            .collection(Paths.stores)
            .doc(storeId)
            .collection(Paths.menuCategories)
            .doc(docId);

        batch.delete(menuCategoryRef);
      }

      await batch.commit();

      emit(DeleteMenuState.success());
    } catch (err) {
      emit(
        DeleteMenuState.error(
          exception: Failure(message: 'Failed to delete menu'),
        ),
      );
    } finally {
      emit(DeleteMenuState.initial());
    }
  }
}
