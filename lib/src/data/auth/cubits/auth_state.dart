part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  unauthenticated,
  anonymous,
  authenticated,
}

class AuthState extends Equatable {
  const AuthState({
    required this.user,
    required this.status,
  });

  factory AuthState.initial() {
    return AuthState(
      user: UserModel.empty(),
      status: AuthStatus.initial,
    );
  }

  final UserModel? user;
  final AuthStatus status;

  @override
  List<Object?> get props => [user, status];

  AuthState copyWith({
    UserModel? user,
    AuthStatus? status,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
