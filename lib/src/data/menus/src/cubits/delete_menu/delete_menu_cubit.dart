import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/extensions/extensions.dart';

part 'delete_menu_state.dart';
part 'delete_menu_cubit.freezed.dart';

class DeleteMenuCubit extends Cubit<DeleteMenuState> {
  final FirebaseFirestore _firebaseFirestore;
  final StoreCacheService _storeCacheService;

  DeleteMenuCubit({
    FirebaseFirestore? firebaseFirestore,
    StoreCacheService? storeCacheService,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(DeleteMenuState.initial());

  Future<void> delete({required MenuModel menu}) async {
    emit(DeleteMenuState.deleting());

    try {
      final storeId = await _storeCacheService.get('storeId');
      final batch = _firebaseFirestore.batch();
      final menuRef = _firebaseFirestore.menuEntitiesDocument(
        storeId: storeId,
        menuId: menu.id!,
      );

      batch.delete(menuRef);

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
