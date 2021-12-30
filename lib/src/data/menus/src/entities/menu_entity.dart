import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:meny/src/data/models/resources/i_resource_model.dart';

part 'menu_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class MenuEntity extends IResourceModel {
  @override
  @JsonKey(ignore: true)
  final String? id;
  final String name;
  final List<String> categoryIds;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const MenuEntity({
    this.id,
    required this.name,
    required this.categoryIds,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MenuEntity.empty() {
    final now = DateTime.now();
    return MenuEntity(
      name: '',
      categoryIds: const [],
      createdAt: now,
      updatedAt: now,
    );
  }

  factory MenuEntity.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data();
    final json = (data as Map<String, dynamic>);
    return MenuEntity.fromJson(json).copyWith(id: snap.id);
  }

  @override
  String toFriendlyString() => 'menu';

  factory MenuEntity.fromJson(Map<String, dynamic> json) =>
      _$MenuEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MenuEntityToJson(this);

  MenuEntity copyWith({
    String? id,
    String? name,
    List<String>? categoryIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MenuEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryIds: categoryIds ?? this.categoryIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        categoryIds,
        createdAt,
        updatedAt,
      ];
}
