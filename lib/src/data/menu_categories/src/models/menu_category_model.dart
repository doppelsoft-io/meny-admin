import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_category_model.freezed.dart';
part 'menu_category_model.g.dart';

@freezed
class MenuCategoryModel with _$MenuCategoryModel {
  factory MenuCategoryModel({
    @JsonKey(ignore: true) String? id,
    required String menuId,
    required String categoryId,
    @Default(-1) int position,
    DateTime? createdAt,
  }) = _MenuCategoryModel;

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryModelFromJson(json);

  factory MenuCategoryModel.empty() {
    return MenuCategoryModel(
      menuId: '',
      categoryId: '',
      createdAt: DateTime.now(),
    );
  }

  factory MenuCategoryModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data()!;
      final json = data as Map<String, dynamic>;
      return MenuCategoryModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return MenuCategoryModel.empty();
    }
  }
}
