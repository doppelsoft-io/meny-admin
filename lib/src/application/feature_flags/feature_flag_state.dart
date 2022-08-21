part of 'feature_flag_cubit.dart';

@freezed
class FeatureFlagState with _$FeatureFlagState {
  const factory FeatureFlagState.loading({@Default(false) bool enabled}) =
      _Loading;
  const factory FeatureFlagState.loaded({required bool enabled}) = _Loaded;
  const factory FeatureFlagState.error({
    required bool enabled,
    required Exception exception,
  }) = _Error;
}
