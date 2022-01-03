import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/auth/auth.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/data/users/users.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final FirebaseAuth _firebaseAuth;
  final StoreCacheService _storeCacheService;

  StreamSubscription? _authSubscription;

  AuthCubit({
    AuthRepository? authRepository,
    UserRepository? userRepository,
    FirebaseAuth? firebaseAuth,
    StoreCacheService? storeCacheService,
  })  : _authRepository = authRepository ?? Locator.instance(),
        _userRepository = userRepository ?? Locator.instance(),
        _firebaseAuth = firebaseAuth ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(AuthState.initial()) {
    print("MEE: AUTH STATE CHANGE AuthCubit");
    _authSubscription?.cancel();
    _authSubscription = _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        userChanged(UserModel.fromFirebaseAuthUser(user));
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

  void userChanged(UserModel user) async {
    print("MEE: userChanged $user ${user.isAnonymous}");
    await Future.delayed(Duration.zero);

    if (user.isAnonymous) {
      emit(state.copyWith(
        status: AuthStatus.anonymous,
        user: user,
      ));
    } else {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      ));
    }
  }

  void appStarted() async {
    UserModel currentUser;
    currentUser = await _authRepository.getCurrentUser();
    if (currentUser == UserModel.empty()) {
      currentUser = await _authRepository.loginAnonymously();
    }
    if (currentUser.isAnonymous) {
      emit(state.copyWith(
        status: AuthStatus.anonymous,
        user: currentUser,
      ));
    } else {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: currentUser,
      ));
    }
  }

  Future<void> logout() async {
    await Future.wait([
      /// Logout
      _authRepository.logout(),

      /// Then login anonymously
      _authRepository.loginAnonymously(),
    ]);

    /// Remove storeId from cache
    _storeCacheService.remove('storeId');
  }
}
