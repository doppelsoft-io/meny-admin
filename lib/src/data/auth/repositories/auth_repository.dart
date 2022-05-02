import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/users/users.dart';
import 'package:meny/src/services/services.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final LoggerService _loggerService;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
    required LoggerService loggerService,
  })  : _firebaseAuth = firebaseAuth ?? Locator.instance(),
        _loggerService = loggerService;

  Future<UserModel> getCurrentUser() async {
    try {
      final currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        return UserModel.fromFirebaseAuthUser(currentUser);
      } else {
        return UserModel.empty();
      }
    } catch (err) {
      _loggerService.log('(getCurrentUser): ${err.toString()}');
      throw const Failure(message: 'Failed to fetch current user');
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
      throw const Failure(message: 'Failed to login anonymously');
    } catch (err) {
      _loggerService.log('(loginAnonymously): ${err.toString()}');
      throw const Failure(message: 'Failed to login anonymously');
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
      throw Failure(message: err.message ?? 'Log in failed');
    } on PlatformException catch (err) {
      _loggerService.log('(loginWithEmailAndPassword): ${err.toString()}');
      throw Failure(message: err.message ?? 'Log in failed');
    }
  }

  Future<UserModel> signUpAndLinkAnonymousUser({
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
          return UserModel.fromFirebaseAuthUser(userCredential.user!);
        }
      }
      return UserModel.empty();
    } on FirebaseAuthException catch (err) {
      _loggerService.log('(signUpAndLinkAnonymousUser): ${err.message}');
      throw Failure(message: err.message ?? 'Sign up failed');
    } on PlatformException catch (err) {
      _loggerService.log('(signUpAndLinkAnonymousUser): ${err.toString()}');
      throw Failure(message: err.message ?? 'Sign up failed');
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (err) {
      _loggerService.log('(logout): ${err.toString()}');
      throw const Failure(message: 'Logout failed');
    }
  }
}
