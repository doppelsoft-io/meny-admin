import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meny/src/data/categories/src/entities/category_entity.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel extends CategoryEntity {
  final List<MenuItemModel> items;
  final int position;

  const CategoryModel({
    String? id,
    required String name,
    required List<String> itemIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    required this.items,
    required this.position,
  }) : super(
          id: id,
          name: name,
          itemIds: itemIds,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

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
    return const CategoryModel(
      id: '',
      name: '',
      itemIds: [],
      createdAt: null,
      updatedAt: null,
      items: [],
      position: 0,
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      itemIds: entity.itemIds,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      items: const [],
      position: 0,
    );
  }

  @override
  String toFriendlyString() => 'category';

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  CategoryModel copyWith({
    String? id,
    String? name,
    List<String>? itemIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<MenuItemModel>? items,
    int? position,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      itemIds: itemIds ?? this.itemIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      items: items ?? this.items,
      position: position ?? this.position,
    );
  }

  CategoryModel mergeWithEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      itemIds: entity.itemIds,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      items: items,
      position: position,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        itemIds,
        createdAt,
        updatedAt,
        items,
        position,
      ];
}
