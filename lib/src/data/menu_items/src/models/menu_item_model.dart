import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';

part 'menu_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MenuItemModel extends MenuItemEntity {
  final int position;

  const MenuItemModel({
    String? id,
    required String name,
    required double price,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String description,
    required this.position,
  }) : super(
          id: id,
          name: name,
          price: price,
          createdAt: createdAt,
          updatedAt: updatedAt,
          description: description,
        );

  factory MenuItemModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data();
      final json = (data as Map<String, dynamic>);
      return MenuItemModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return MenuItemModel.empty();
    }
  }

  factory MenuItemModel.empty() {
    final now = DateTime.now();
    return MenuItemModel(
      name: '',
      price: 0.0,
      createdAt: now,
      updatedAt: now,
      description: '',
      position: 0,
    );
  }

  factory MenuItemModel.fromEntity(MenuItemEntity entity) {
    return MenuItemModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      description: entity.description,
      position: 0,
    );
  }

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);

  @override
  MenuItemModel copyWith({
    String? id,
    String? name,
    double? price,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    int? position,
  }) {
    return MenuItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      position: position ?? this.position,
    );
  }

  MenuItemModel mergeWithEntity(MenuItemEntity item) {
    return MenuItemModel(
      id: item.id,
      name: item.name,
      price: item.price,
      createdAt: item.createdAt,
      updatedAt: item.updatedAt,
      description: item.description,
      position: position,
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
        position,
      ];
}
