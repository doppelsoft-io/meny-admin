part of 'menu_categories_cubit.dart';

@freezed
class MenuCategoriesState with _$MenuCategoriesState {
  const factory MenuCategoriesState.initial({
    @Default(<MenuCategoryModel>[]) List<MenuCategoryModel> menuCategories,
    @Default(<MenuModel>[]) List<MenuModel> menus,
  }) = _Initial;

  const factory MenuCategoriesState.adding({
    required List<MenuCategoryModel> menuCategories,
    required List<MenuModel> menus,
  }) = _Adding;

  const factory MenuCategoriesState.removing({
    required List<MenuCategoryModel> menuCategories,
    required List<MenuModel> menus,
  }) = _Removing;

  const factory MenuCategoriesState.success({
    required List<MenuCategoryModel> menuCategories,
    required List<MenuModel> menus,
  }) = _Success;

  const factory MenuCategoriesState.error({
    required List<MenuCategoryModel> menuCategories,
    required List<MenuModel> menus,
    required Exception exception,
  }) = _Error;
}
