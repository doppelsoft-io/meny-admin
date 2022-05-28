import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/auth/auth.dart';
import 'package:meny_admin/src/data/users/models/user_model.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? Locator.instance(),
        super(const LoginState.initial());

  final AuthRepository _authRepository;

  Future<void> loginWithCredentials({
    required String email,
    required String password,
  }) async {
    try {
      emit(const LoginState.loggingIn());
      final user = await _authRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginState.done(result: right(user)));
    } on CustomException catch (failure) {
      emit(LoginState.done(result: left(failure)));
    } catch (err) {
      emit(
        LoginState.done(
          result: left(CustomException(message: err.toString())),
        ),
      );
    } finally {
      emit(const LoginState.initial());
    }
  }
}
