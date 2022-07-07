part of 'edit_menu_cubit.dart';

@freezed
class EditMenuState with _$EditMenuState {
  const factory EditMenuState.initial({
    required MenuModel menu,
  }) = _Initial;

  const factory EditMenuState.loading({
    required MenuModel menu,
  }) = _Loading;

  const factory EditMenuState.loaded({
    required MenuModel menu,
  }) = _Loaded;

  const factory EditMenuState.updating({
    required MenuModel menu,
  }) = _Updating;

  const factory EditMenuState.success({
    required MenuModel menu,
  }) = _Success;

  const factory EditMenuState.error({
    required MenuModel menu,
    required Exception exception,
  }) = _Error;
}
