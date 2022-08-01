import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'delete_menu_cubit.freezed.dart';
part 'delete_menu_state.dart';

class DeleteMenuCubit extends Cubit<DeleteMenuState> {
  DeleteMenuCubit({
    required StoreCubit storeCubit,
    FirebaseFirestore? firebaseFirestore,
    MenuCategoryRepository? menuCategoryRepository,
  })  : _storeCubit = storeCubit,
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _menuCategoryRepository = menuCategoryRepository ?? Locator.instance(),
        super(const DeleteMenuState.initial());

  final FirebaseFirestore _firebaseFirestore;
  final StoreCubit _storeCubit;
  final MenuCategoryRepository _menuCategoryRepository;

  Future<void> delete({required MenuModel menu}) async {
    emit(const DeleteMenuState.deleting());

    try {
      final storeId = _storeCubit.state.store.id!;
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

      emit(const DeleteMenuState.success());
    } catch (err) {
      emit(
        DeleteMenuState.error(
          exception: CustomException(message: err.toString()),
        ),
      );
    } finally {
      emit(const DeleteMenuState.initial());
    }
  }
}
