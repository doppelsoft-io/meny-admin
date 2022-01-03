part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loggingIn,
  done,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final Either<Failure, UserModel>? result;

  const LoginState({
    required this.status,
    required this.result,
  });

  bool get isLoggingIn => status == LoginStatus.loggingIn;

  @override
  List<Object?> get props => [status, result];

  factory LoginState.initial() {
    return LoginState(
      status: LoginStatus.initial,
      result: null,
    );
  }

  LoginState copyWith({
    LoginStatus? status,
    Either<Failure, UserModel>? result,
  }) {
    return LoginState(
      status: status ?? LoginStatus.initial,
      result: result ?? this.result,
    );
  }
}
