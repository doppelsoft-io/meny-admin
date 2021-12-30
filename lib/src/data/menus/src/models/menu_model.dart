import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/menus/menus.dart';

part 'menu_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MenuModel extends MenuEntity {
  final List<CategoryModel> categories;

  const MenuModel({
    String? id,
    required String name,
    required List<String> categoryIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    required this.categories,
  }) : super(
          id: id,
          name: name,
          categoryIds: categoryIds,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory MenuModel.empty() {
    return const MenuModel(
      name: '',
      categoryIds: [],
      createdAt: null,
      updatedAt: null,
      categories: [],
    );
  }

  factory MenuModel.fromEntity(MenuEntity entity) {
    return MenuModel(
      id: entity.id,
      name: entity.name,
      categoryIds: entity.categoryIds,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      categories: const [],
    );
  }

  factory MenuModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data();
      final json = (data as Map<String, dynamic>);

      return MenuModel.fromJson(json).copyWith(id: snap.id);
    } catch (err) {
      return MenuModel.empty();
    }
  }

  @override
  String toFriendlyString() => 'menu';

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MenuModelToJson(this);

  @override
  MenuModel copyWith({
    String? id,
    String? name,
    List<String>? categoryIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<CategoryModel>? categories,
  }) {
    return MenuModel(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryIds: categoryIds ?? this.categoryIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        categoryIds,
        createdAt,
        updatedAt,
        categories,
      ];
}
