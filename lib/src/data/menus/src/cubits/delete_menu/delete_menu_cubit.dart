import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';

part 'delete_menu_state.dart';

class DeleteMenuCubit extends Cubit<DeleteMenuState> {
  final FirebaseFirestore _firebaseFirestore;

  DeleteMenuCubit({
    FirebaseFirestore? firebaseFirestore,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        super(DeleteMenuState.initial());

  void delete({required MenuEntity menu}) async {
    emit(state.copyWith(
      status: DeleteMenuStatus.deleting,
      failure: null,
    ));

    try {
      final batch = _firebaseFirestore.batch();
      final menuRef = _firebaseFirestore.collection(Paths.menus).doc(menu.id);
      batch.delete(menuRef);
      await batch.commit();

      emit(
        state.copyWith(
          status: DeleteMenuStatus.success,
          failure: null,
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(
          status: DeleteMenuStatus.error,
          failure: Failure(
            message: 'Deleting menu failed.',
          ),
        ),
      );
    }
  }
}
