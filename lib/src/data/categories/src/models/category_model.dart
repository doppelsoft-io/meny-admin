import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/src/data/categories/src/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory CategoryModel({
    String? id,
    required String name,
    DateTime? createdAt,
    DateTime? updatedAt,
    required int position,
  }) = _CategoryModel;

  const CategoryModel._();

  factory CategoryModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final Object? data = snap.data();
      final json = (data as Map<String, dynamic>);
      return CategoryModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return CategoryModel.empty();
    }
  }

  factory CategoryModel.empty() {
    return CategoryModel(
      id: '',
      name: '',
      createdAt: null,
      updatedAt: null,
      position: 0,
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      position: 0,
    );
  }

  String toFriendlyString() => 'category';

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  // CategoryModel mergeWithEntity(CategoryEntity entity) {
  //   return CategoryModel(
  //     id: entity.id,
  //     name: entity.name,
  //     createdAt: entity.createdAt,
  //     updatedAt: entity.updatedAt,
  //     position: position,
  //   );
  // }
}
