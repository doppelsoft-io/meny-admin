import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory CategoryMenuItemModel.empty() {
    return CategoryMenuItemModel(
      categoryId: '',
      menuItemId: '',
    );
  }

  factory CategoryMenuItemModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data()!;
      final json = data as Map<String, dynamic>;
      return CategoryMenuItemModel.fromJson(json);
    } catch (e) {
      return CategoryMenuItemModel.empty();
    }
  }
}
