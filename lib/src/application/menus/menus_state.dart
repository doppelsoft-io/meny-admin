part of 'menus_cubit.dart';

@freezed
class MenusState with _$MenusState {
  const factory MenusState.loading({
    @Default(<MenuModel>[]) List<MenuModel> menus,
    @Default(OrderBy()) OrderBy orderBy,
  }) = _Loading;

  const factory MenusState.loaded({
    required List<MenuModel> menus,
    required OrderBy orderBy,
  }) = _Loaded;

  const factory MenusState.error({
    required List<MenuModel> menus,
    required Exception exception,
    required OrderBy orderBy,
  }) = _Error;
}
