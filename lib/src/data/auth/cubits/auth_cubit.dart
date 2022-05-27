import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/auth/auth.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/data/users/users.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    AuthRepository? authRepository,
    FirebaseAuth? firebaseAuth,
    StoreCacheService? storeCacheService,
  })  : _authRepository = authRepository ?? Locator.instance(),
        _firebaseAuth = firebaseAuth ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(AuthState.initial()) {
    _authSubscription?.cancel();
    _authSubscription = _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        userChanged(UserModel.fromFirebaseAuthUser(user));
      }
    });
  }

  final AuthRepository _authRepository;
  final FirebaseAuth _firebaseAuth;
  final StoreCacheService _storeCacheService;

  StreamSubscription? _authSubscription;

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

  Future<void> userChanged(UserModel user) async {
    await Future<void>.delayed(Duration.zero);

    if (user.isAnonymous) {
      emit(
        state.copyWith(
          status: AuthStatus.anonymous,
          user: user,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
        ),
      );
    }
  }

  Future<void> appStarted() async {
    UserModel currentUser;
    currentUser = await _authRepository.getCurrentUser();
    if (currentUser == UserModel.empty()) {
      currentUser = await _authRepository.loginAnonymously();
    }
    if (currentUser.isAnonymous) {
      emit(
        state.copyWith(
          status: AuthStatus.anonymous,
          user: currentUser,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          user: currentUser,
        ),
      );
    }
  }

  Future<void> logout() async {
    /// Remove storeId from cache
    await _storeCacheService.remove('storeId');

    await Future.wait([
      /// Logout
      _authRepository.logout(),

      /// Then login anonymously
      _authRepository.loginAnonymously(),
    ]);
  }
}
