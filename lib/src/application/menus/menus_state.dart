part of 'menus_cubit.dart';

@freezed
class MenusState with _$MenusState {
  const factory MenusState.loading({
    @Default(<MenuModel>[]) List<MenuModel> menus,
  }) = _Loading;

  const factory MenusState.loaded({
    required List<MenuModel> menus,
  }) = _Loaded;

  const factory MenusState.error({
    required List<MenuModel> menus,
    required Exception exception,
  }) = _Error;
}
