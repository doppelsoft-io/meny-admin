import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:meny/src/data/models/resources/i_resource_model.dart';

part 'menu_item_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class MenuItemEntity extends IResourceModel {
  @override
  @JsonKey(ignore: true)
  final String? id;

  final String name;

  @JsonKey(defaultValue: 0.0)
  final double price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String description;

  const MenuItemEntity({
    this.id,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
  });

  factory MenuItemEntity.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data();
      final json = (data as Map<String, dynamic>);
      return MenuItemEntity.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return MenuItemEntity.empty();
    }
  }

  factory MenuItemEntity.empty() {
    final now = DateTime.now();
    return MenuItemEntity(
      name: '',
      price: 0.0,
      createdAt: now,
      updatedAt: now,
      description: '',
    );
  }

  @override
  String toFriendlyString() => 'menu item';

  factory MenuItemEntity.fromJson(Map<String, dynamic> json) =>
      _$MenuItemEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MenuItemEntityToJson(this);

  MenuItemEntity copyWith({
    String? id,
    String? name,
    double? price,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
  }) {
    return MenuItemEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        createdAt,
        updatedAt,
        description,
      ];
}
