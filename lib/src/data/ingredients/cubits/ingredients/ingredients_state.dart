part of 'ingredients_cubit.dart';

@freezed
class IngredientsState with _$IngredientsState {
  const factory IngredientsState.loading({
    @Default(<MenuItemModel>[]) List<MenuItemModel> items,
  }) = _Loading;

  const factory IngredientsState.loaded({
    required List<MenuItemModel> items,
  }) = _Loaded;

  const factory IngredientsState.error({
    required List<MenuItemModel> items,
    required Exception exception,
  }) = _Error;
}
