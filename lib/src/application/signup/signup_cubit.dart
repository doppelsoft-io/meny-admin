import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    AuthRepository? authRepository,
    FirebaseFirestore? firebaseFirestore,
    required AuthCubit authCubit,
  })  : _authRepository = authRepository ?? Locator.instance(),
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _authCubit = authCubit,
        super(SignupState.initial(store: StoreModel.empty()));

  final AuthRepository _authRepository;
  final FirebaseFirestore _firebaseFirestore;
  final AuthCubit _authCubit;

  Future<void> handleSignUp({
    required StoreModel store,
    required String email,
    required String password,
  }) async {
    try {
      emit(
        SignupState.signingIn(
          store: store,
          email: email,
          password: password,
        ),
      );

      final storeRef = _firebaseFirestore.storesDocument(storeId: store.id!);

      final createdUser = await _authRepository.signUpAndLinkAnonymousUser(
        email: email,
        password: password,
      );

      final batch = _firebaseFirestore.batch();

      final usersRef =
          _firebaseFirestore.usersDocument(userId: createdUser.id!);

      batch
        ..set(usersRef, createdUser.toJson())
        ..set(storeRef, store.toJson(), SetOptions(merge: true));

      await batch.commit();

      await _authCubit.userChanged(createdUser);

      emit(
        SignupState.done(
          store: state.store,
          email: state.email,
          password: state.password,
          result: right(true),
        ),
      );
    } on CustomException catch (err) {
      emit(
        SignupState.done(
          store: state.store,
          email: state.email,
          password: state.password,
          result: left(err),
        ),
      );
    } catch (err) {
      emit(
        SignupState.done(
          store: state.store,
          email: state.email,
          password: state.password,
          result: left(CustomException(message: err.toString())),
        ),
      );
    } finally {
      emit(
        SignupState.initial(store: state.store),
      );
    }
  }
}
