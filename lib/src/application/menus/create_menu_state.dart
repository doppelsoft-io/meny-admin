part of 'create_menu_cubit.dart';

@freezed
class CreateMenuState with _$CreateMenuState {
  const factory CreateMenuState.initial({
    required MenuModel menu,
  }) = _Initial;

  const factory CreateMenuState.creating({
    required MenuModel menu,
  }) = _Creating;

  const factory CreateMenuState.created({
    required MenuModel menu,
  }) = _Created;

  const factory CreateMenuState.error({
    required MenuModel menu,
    required Exception exception,
  }) = _Error;
}
