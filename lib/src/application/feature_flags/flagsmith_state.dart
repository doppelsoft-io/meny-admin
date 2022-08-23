part of 'flagsmith_cubit.dart';

@freezed
class FlagsmithState with _$FlagsmithState {
  const factory FlagsmithState.loading({
    @Default(<Flag>[]) List<Flag> flags,
  }) = _Loading;

  const factory FlagsmithState.loaded({
    required List<Flag> flags,
  }) = _Loaded;

  const factory FlagsmithState.error({
    required List<Flag> flags,
    required Exception exception,
  }) = _Error;
}
