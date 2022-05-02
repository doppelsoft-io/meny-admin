import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/auth/auth.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/extensions/extensions.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    AuthRepository? authRepository,
    FirebaseFirestore? firebaseFirestore,
    required AuthCubit authCubit,
  })  : _authRepository = authRepository ?? Locator.instance(),
        _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _authCubit = authCubit,
        super(SignupState.initial());

  final AuthRepository _authRepository;
  final FirebaseFirestore _firebaseFirestore;
  final AuthCubit _authCubit;

  Future<void> handleSignUp({
    required StoreModel store,
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(status: SignupStatus.signingIn));

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

      emit(state.copyWith(result: right(true)));
    } on Failure catch (failure) {
      emit(state.copyWith(result: left(failure)));
    } catch (err) {
      emit(state.copyWith(result: left(Failure(message: err.toString()))));
    } finally {
      emit(state.copyWith(status: SignupStatus.done));
    }
  }
}
