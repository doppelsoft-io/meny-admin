import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory MenuItemModel({
    // ignore: invalid_annotation_target
    @JsonKey(ignore: true) String? id,
    required String name,
    required double price,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String description,
    required int position,
  }) = _MenuItemModel;

  const MenuItemModel._();

  factory MenuItemModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data();
      final json = data as Map<String, dynamic>;
      return MenuItemModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return MenuItemModel.empty();
    }
  }

  factory MenuItemModel.empty() {
    final now = DateTime.now();
    return MenuItemModel(
      name: '',
      price: 0,
      createdAt: now,
      updatedAt: now,
      description: '',
      position: 0,
    );
  }

  factory MenuItemModel.fromEntity(MenuItemModel entity) {
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

  String toFriendlyString() => 'menu item';
  // MenuItemModel mergeWithEntity(MenuItemModel item) {
  //   return MenuItemModel(
  //     id: item.id,
  //     name: item.name,
  //     price: item.price,
  //     createdAt: item.createdAt,
  //     updatedAt: item.updatedAt,
  //     description: item.description,
  //     position: position,
  //   );
  // }

}
