part of 'edit_store_cubit.dart';

@freezed
class EditStoreState with _$EditStoreState {
  const factory EditStoreState.initial({
    required StoreModel store,
  }) = _Initial;

  const factory EditStoreState.saving({
    required StoreModel store,
  }) = _Saving;

  const factory EditStoreState.success({
    required StoreModel store,
  }) = _Success;

  const factory EditStoreState.error({
    required StoreModel store,
    required Exception exception,
  }) = _Error;
}
