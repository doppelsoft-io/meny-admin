import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory CategoryModel({
    // ignore: invalid_annotation_target
    @JsonKey(ignore: true) String? id,
    required String name,
    DateTime? createdAt,
    DateTime? updatedAt,
    required int position,
  }) = _CategoryModel;

  const CategoryModel._();

  factory CategoryModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data();
      final json = data as Map<String, dynamic>;
      return CategoryModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return CategoryModel.empty();
    }
  }

  factory CategoryModel.empty() {
    return const CategoryModel(
      id: '',
      name: '',
      position: 0,
    );
  }

  factory CategoryModel.fromEntity(CategoryModel entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      position: 0,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  String toFriendlyString() => 'category';
}
