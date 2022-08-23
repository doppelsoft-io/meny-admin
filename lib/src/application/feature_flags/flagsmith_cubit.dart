import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flagsmith/flagsmith.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';

part 'flagsmith_state.dart';
part 'flagsmith_cubit.freezed.dart';

class FlagsmithClientException implements Exception {
  /// {@macro challenge_exception}
  const FlagsmithClientException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

/// {@template get_challenges_exception}
/// Thrown when getting challenges process fails.
/// {@endtemplate}
class GetFlagsmithFlagsException extends FlagsmithClientException {
  /// {@macro get_challenges_exception}
  const GetFlagsmithFlagsException({String? message}) : super(message: message);
}

class FlagsmithCubit extends Cubit<FlagsmithState> {
  FlagsmithCubit({
    AuthCubit? authCubit,
    FlagsmithClient? flagsmithClient,
  })  : _authCubit = authCubit ?? Locator.instance(),
        _flagsmithClient = flagsmithClient ?? Locator.instance(),
        super(const _Loading()) {
    _authCubit.state.maybeWhen(
      authenticated: _fetchFlags,
      orElse: () {
        _subscription?.cancel();
        _subscription = _authCubit.stream.listen((authState) {
          authState.maybeWhen(
            authenticated: _fetchFlags,
            orElse: () {},
          );
        });
      },
    );
  }

  final FlagsmithClient _flagsmithClient;
  final AuthCubit _authCubit;
  StreamSubscription<AuthState>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }

  bool isFeatureFlagEnabled(String name) {
    final flag = getFlagByName(name);
    return flag?.enabled ?? false;
  }

  Flag? getFlagByName(String name) {
    try {
      return state.flags.firstWhere((f) => f.feature.name == name);
    } catch (err) {
      return null;
    }
  }

  Future<void> _fetchFlags(UserModel user) async {
    try {
      final identity = Identity(identifier: user.id!);

      final flags = await _flagsmithClient.getFeatureFlags(user: identity);
      emit(_Loaded(flags: flags));
    } catch (err) {
      emit(
        _Error(
          flags: state.flags,
          exception: const GetFlagsmithFlagsException(
            message: 'Error fetching flags',
          ),
        ),
      );
    }
  }
}
