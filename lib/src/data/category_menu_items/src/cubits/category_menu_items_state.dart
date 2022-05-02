part of 'category_menu_items_cubit.dart';

@freezed
class CategoryMenuItemsState with _$CategoryMenuItemsState {
  const factory CategoryMenuItemsState.initial({
    @Default(<CategoryModel>[]) List<CategoryModel> categories,
    @Default(<CategoryMenuItemModel>[])
        List<CategoryMenuItemModel> categoryMenuItems,
  }) = _Initial;

  const factory CategoryMenuItemsState.adding({
    required List<CategoryModel> categories,
    required List<CategoryMenuItemModel> categoryMenuItems,
  }) = _Adding;

  const factory CategoryMenuItemsState.removing({
    required List<CategoryModel> categories,
    required List<CategoryMenuItemModel> categoryMenuItems,
  }) = _Removing;

  const factory CategoryMenuItemsState.success({
    required List<CategoryModel> categories,
    required List<CategoryMenuItemModel> categoryMenuItems,
  }) = _Success;

  const factory CategoryMenuItemsState.error({
    required List<CategoryModel> categories,
    required List<CategoryMenuItemModel> categoryMenuItems,
    required Exception exception,
  }) = _Error;
}
