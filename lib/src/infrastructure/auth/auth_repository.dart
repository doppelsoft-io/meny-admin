import 'dart:async';

import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_admin/src/services/services.dart';

class AnonymousUserException extends CustomException {
  const AnonymousUserException({String? message}) : super(message: message);
}

class GetCurrentUserException extends CustomException {
  const GetCurrentUserException({String? message}) : super(message: message);
}

class AnonymousLoginException extends CustomException {
  const AnonymousLoginException({String? message}) : super(message: message);
}

class EmailLoginException extends CustomException {
  const EmailLoginException({String? message}) : super(message: message);
}

class SignUpAndLinkException extends CustomException {
  const SignUpAndLinkException({String? message}) : super(message: message);
}

class LogOutException extends CustomException {
  const LogOutException({String? message}) : super(message: message);
}

class AuthRepository {
  AuthRepository({
    FirebaseAuth? firebaseAuth,
    required LoggerService loggerService,
  })  : _firebaseAuth = firebaseAuth ?? Locator.instance(),
        _loggerService = loggerService;

  final FirebaseAuth _firebaseAuth;
  final LoggerService _loggerService;

  Future<UserModel> getCurrentUser() async {
    StreamSubscription<User?>? subscription;
    try {
      final completer = Completer<User?>();
      subscription =
          _firebaseAuth.authStateChanges().listen(completer.complete);
      final currentUser = await completer.future;

      await subscription.cancel();
      if (currentUser != null) {
        return UserModel.fromFirebaseAuthUser(currentUser);
      } else {
        return UserModel.empty();
      }
    } catch (err) {
      await subscription?.cancel();
      _loggerService.log('(getCurrentUser): ${err.toString()}');
      throw const GetCurrentUserException(
        message: 'Failed to fetch current user',
      );
    }
  }

  Future<UserModel> loginAnonymously() async {
    try {
      final credential = await _firebaseAuth.signInAnonymously();

      if (credential.user != null) {
        final user = UserModel.fromFirebaseAuthUser(credential.user!);
        return user;
      } else {
        return UserModel.empty();
      }
    } on PlatformException catch (err) {
      _loggerService.log('(loginAnonymously): ${err.message}');
      throw const AnonymousLoginException(
        message: 'Failed to login anonymously',
      );
    } catch (err) {
      _loggerService.log('(loginAnonymously): ${err.toString()}');
      throw const AnonymousLoginException(
        message: 'Failed to login anonymously',
      );
    }
  }

  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return UserModel.fromFirebaseAuthUser(credential.user!);
      }
      return UserModel.empty();
    } on FirebaseAuthException catch (err) {
      _loggerService.log('(loginWithEmailAndPassword): ${err.message}');
      throw EmailLoginException(message: err.message ?? 'Log in failed');
    } on PlatformException catch (err) {
      _loggerService.log('(loginWithEmailAndPassword): ${err.toString()}');
      throw EmailLoginException(message: err.message ?? 'Log in failed');
    }
  }

  Future<User?> signUpAndLinkAnonymousUser({
    required String email,
    required String password,
  }) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null && currentUser.isAnonymous) {
        final credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );
        final userCredential = await currentUser.linkWithCredential(credential);
        if (userCredential.user != null) {
          return userCredential.user!;
        }
      }
      return null;
    } on FirebaseAuthException catch (err) {
      _loggerService.log('(signUpAndLinkAnonymousUser): ${err.message}');
      throw SignUpAndLinkException(message: err.message ?? 'Sign up failed');
    } on PlatformException catch (err) {
      _loggerService.log('(signUpAndLinkAnonymousUser): ${err.toString()}');
      throw SignUpAndLinkException(message: err.message ?? 'Sign up failed');
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (err) {
      _loggerService.log('(logout): ${err.toString()}');
      throw const LogOutException(message: 'Logout failed');
    }
  }
}
