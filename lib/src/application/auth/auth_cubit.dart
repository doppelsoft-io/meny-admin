import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    AuthRepository? authRepository,
    FirebaseAuth? firebaseAuth,
    StoreCacheService? storeCacheService,
  })  : _authRepository = authRepository ?? Locator.instance(),
        _firebaseAuth = firebaseAuth ?? Locator.instance(),
        _storeCacheService = storeCacheService ?? Locator.instance(),
        super(_Initial(user: UserModel.empty())) {
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
      emit(_Anonymous(user: user));
    } else {
      emit(_Authenticated(user: user));
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
    await _storeCacheService.remove('storeId');

    await Future.wait([
      /// Logout
      _authRepository.logout(),

      /// Then login anonymously
      _authRepository.loginAnonymously(),
    ]);
  }
}
