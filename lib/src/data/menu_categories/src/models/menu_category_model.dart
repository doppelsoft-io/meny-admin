import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_category_model.freezed.dart';
part 'menu_category_model.g.dart';

@freezed
class MenuCategoryModel with _$MenuCategoryModel {
  factory MenuCategoryModel({
    required String menuId,
    required String categoryId,
  }) = _MenuCategoryModel;

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryModelFromJson(json);

  factory MenuCategoryModel.empty() {
    return MenuCategoryModel(
      menuId: '',
      categoryId: '',
    );
  }

  factory MenuCategoryModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data();
      final json = data as Map<String, dynamic>;
      return MenuCategoryModel.fromJson(json);
    } catch (e) {
      return MenuCategoryModel.empty();
    }
  }
}
