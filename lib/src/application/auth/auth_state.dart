part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  unauthenticated,
  authenticated,
}

@freezed
class AuthState with _$AuthState {
  factory AuthState.initial({
    required UserModel user,
  }) = _Initial;

  factory AuthState.unauthenticated({
    required UserModel user,
  }) = _Unauthenticated;

  factory AuthState.authenticated({
    required UserModel user,
  }) = _Authenticated;
}
