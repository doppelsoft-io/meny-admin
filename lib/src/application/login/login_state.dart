part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loggingIn,
  done,
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loggingIn() = _LoggingIn;

  const factory LoginState.done({
    required Either<CustomException, UserModel> result,
  }) = _Done;
}
