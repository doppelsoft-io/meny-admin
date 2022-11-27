part of 'menu_items_cubit.dart';

@freezed
class MenuItemsState with _$MenuItemsState {
  const factory MenuItemsState.loading({
    @Default(<MenuItemModel>[]) List<MenuItemModel> items,
    @Default(OrderBy()) OrderBy orderBy,
  }) = _Loading;

  const factory MenuItemsState.loaded({
    required List<MenuItemModel> items,
    required OrderBy orderBy,
  }) = _Loaded;

  const factory MenuItemsState.error({
    required List<MenuItemModel> items,
    required OrderBy orderBy,
    required Exception exception,
  }) = _Error;
}
