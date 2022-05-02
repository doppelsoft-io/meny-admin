part of 'store_cubit.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState.loading({
    required StoreModel store,
  }) = _Loading;

  const factory StoreState.loaded({
    required StoreModel store,
  }) = _Loaded;

  const factory StoreState.error({
    required StoreModel store,
    required Exception exception,
  }) = _Error;
}
