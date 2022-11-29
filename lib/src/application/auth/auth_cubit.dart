import 'dart:async';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_core/meny_core.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    AuthRepository? authRepository,
    FirebaseAuth? firebaseAuth,
    FlagsmithClient? flagsmithClient,
  })  : _authRepository = authRepository ?? Locator.instance(),
        _firebaseAuth = firebaseAuth ?? Locator.instance(),
        _flagsmithClient = flagsmithClient ?? Locator.instance(),
        super(_Initial(user: UserModel.empty())) {
    _authSubscription?.cancel();
    _authSubscription = _firebaseAuth.authStateChanges().listen(userChanged);
  }

  final AuthRepository _authRepository;
  final FirebaseAuth _firebaseAuth;
  final FlagsmithClient _flagsmithClient;

  StreamSubscription? _authSubscription;

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

  void emitUnauthenticated() {
    emit(_Unauthenticated(user: UserModel.empty()));
  }

  Future<void> userChanged(User? firebaseUser) async {
    if (firebaseUser != null) {
      final userModel = UserModel.fromFirebaseAuthUser(firebaseUser);
      // ignore: unawaited_futures
      _flagsmithClient.getFeatureFlags(
        user: Identity(identifier: userModel.id!),
      );
      if (firebaseUser.isAnonymous) {
        emit(_Anonymous(user: userModel));
      } else {
        emit(_Authenticated(user: userModel));
      }
    } else {
      emit(_Unauthenticated(user: UserModel.empty()));
    }
  }

  Future<void> appStarted() async {
    UserModel currentUser;
    currentUser = await _authRepository.getCurrentUser();
    if (currentUser == UserModel.empty()) {
      currentUser = await _authRepository.loginAnonymously();
    }
    if (currentUser.isAnonymous) {
      emit(_Anonymous(user: currentUser));
    } else {
      emit(_Authenticated(user: currentUser));
    }
  }

  Future<void> logout() async {
    /// Remove storeId from cache

    await Future.wait([
      /// Logout
      _authRepository.logout(),

      /// Then login anonymously
      _authRepository.loginAnonymously(),
    ]);
  }
}
