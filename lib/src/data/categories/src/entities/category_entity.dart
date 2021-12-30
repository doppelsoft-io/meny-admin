import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:meny/src/data/models/resources/i_resource_model.dart';

part 'category_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryEntity extends IResourceModel {
  @override
  @JsonKey(ignore: true)
  final String? id;
  final String name;
  final List<String> itemIds;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryEntity({
    this.id,
    required this.name,
    required this.itemIds,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryEntity.empty() {
    final now = DateTime.now();
    return CategoryEntity(
      name: '',
      itemIds: const [],
      createdAt: now,
      updatedAt: now,
    );
  }

  factory CategoryEntity.fromSnapshot(DocumentSnapshot snap) {
    try {
      final Object? data = snap.data();
      final json = (data as Map<String, dynamic>);
      return CategoryEntity.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return CategoryEntity.empty();
    }
  }

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);

  @override
  String toFriendlyString() => 'category';

  CategoryEntity copyWith({
    String? id,
    String? name,
    List<String>? itemIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      itemIds: itemIds ?? this.itemIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        updatedAt,
      ];
}
