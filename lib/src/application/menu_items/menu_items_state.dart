part of 'menu_items_cubit.dart';

@freezed
class MenuItemsState with _$MenuItemsState {
  const factory MenuItemsState.loading({
    @Default(<MenuItemModel>[]) List<MenuItemModel> items,
  }) = _Loading;

  const factory MenuItemsState.loaded({
    required List<MenuItemModel> items,
  }) = _Loaded;

  const factory MenuItemsState.error({
    required List<MenuItemModel> items,
    required Exception exception,
  }) = _Error;
}
