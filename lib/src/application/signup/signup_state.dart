part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  signingIn,
  done,
}

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial({
    required StoreModel store,
    @Default('') String email,
    @Default('') String password,
  }) = _Initial;

  const factory SignupState.signingIn({
    required StoreModel store,
    required String email,
    required String password,
  }) = _SigningIn;

  const factory SignupState.done({
    required StoreModel store,
    required String email,
    required String password,
    required Either<CustomException, bool> result,
  }) = _Done;
}
