import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_menu_item_model.freezed.dart';
part 'category_menu_item_model.g.dart';

@freezed
class CategoryMenuItemModel with _$CategoryMenuItemModel {
  factory CategoryMenuItemModel({
    @JsonKey(ignore: true) String? id,
    required String categoryId,
    required String menuItemId,
    int? position,
    DateTime? createdAt,
  }) = _CategoryMenuItemModel;

  factory CategoryMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMenuItemModelFromJson(json);

  factory CategoryMenuItemModel.empty() {
    return CategoryMenuItemModel(
      categoryId: '',
      menuItemId: '',
      createdAt: DateTime.now(),
    );
  }

  factory CategoryMenuItemModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data()!;
      final json = data as Map<String, dynamic>;
      return CategoryMenuItemModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return CategoryMenuItemModel.empty();
    }
  }
}
