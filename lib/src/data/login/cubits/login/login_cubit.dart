import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/auth/auth.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/users/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? Locator.instance(),
        super(LoginState.initial());

  void loginWithCredentials({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(status: LoginStatus.loggingIn));
      final user = await _authRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(result: right(user)));
    } on Failure catch (failure) {
      emit(state.copyWith(result: left(failure)));
    } catch (err) {
      emit(state.copyWith(result: left(Failure(message: err.toString()))));
    } finally {
      emit(state.copyWith(status: LoginStatus.done));
    }
  }
}
