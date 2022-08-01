part of 'delete_menu_cubit.dart';

@freezed
class DeleteMenuState with _$DeleteMenuState {
  const factory DeleteMenuState.initial() = _Initial;
  const factory DeleteMenuState.deleting() = _Deleting;
  const factory DeleteMenuState.success() = _Success;
  const factory DeleteMenuState.error({
    required Exception exception,
  }) = _Error;
}
