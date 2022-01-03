part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  unauthenticated,
  anonymous,
  authenticated,
}

class AuthState extends Equatable {
  final UserModel? user;
  final AuthStatus status;

  const AuthState({
    required this.user,
    required this.status,
  });

  @override
  List<Object?> get props => [user, status];

  factory AuthState.initial() {
    return AuthState(
      user: UserModel.empty(),
      status: AuthStatus.initial,
    );
  }

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
