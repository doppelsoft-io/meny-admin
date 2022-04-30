import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_menu_item_model.freezed.dart';
part 'category_menu_item_model.g.dart';

@freezed
class CategoryMenuItemModel with _$CategoryMenuItemModel {
  factory CategoryMenuItemModel({
    required String categoryId,
    required String menuItemId,
  }) = _CategoryMenuItemModel;

  factory CategoryMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMenuItemModelFromJson(json);
}
