import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flagsmith/flagsmith.dart';
import 'package:meny_admin/locator.dart';

part 'feature_flag_cubit.freezed.dart';
part 'feature_flag_state.dart';

class FeatureFlagCubit extends Cubit<FeatureFlagState> {
  FeatureFlagCubit({
    required String flag,
    FlagsmithClient? flagsmithClient,
  })  : _flag = flag,
        _flagsmithClient = flagsmithClient ?? Locator.instance(),
        super(const _Loading()) {
    _subscription?.cancel();
    _subscription = _flagsmithClient.stream(_flag)?.listen((flag) {
      emit(_Loaded(enabled: flag.enabled ?? false));
    });
  }

  final String _flag;
  final FlagsmithClient _flagsmithClient;
  StreamSubscription<Flag>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
