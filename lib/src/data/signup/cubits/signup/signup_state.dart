part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  signingIn,
  done,
}

class SignupState extends Equatable {
  final SignupStatus status;
  final StoreModel? store;
  final String email;
  final String password;
  final Either<Failure, bool>? result;

  const SignupState({
    required this.status,
    required this.store,
    required this.email,
    required this.password,
    required this.result,
  });

  @override
  List<Object?> get props => [status, store, email, password, result];

  bool get isSigninIn => status == SignupStatus.signingIn;

  factory SignupState.initial() {
    return SignupState(
      status: SignupStatus.initial,
      store: null,
      email: '',
      password: '',
      result: null,
    );
  }

  SignupState copyWith({
    SignupStatus? status,
    StoreModel? store,
    String? email,
    String? password,
    Either<Failure, bool>? result,
  }) {
    return SignupState(
      status: status ?? SignupStatus.initial,
      store: store ?? this.store,
      email: email ?? this.email,
      password: password ?? this.password,
      result: result ?? this.result,
    );
  }
}
