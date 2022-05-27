import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meny/src/data/menu_items/src/models/price_info.dart';

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
    required PriceInfo priceInfo,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String description,
    String? imageUrl,
  }) = _MenuItemModel;

  const MenuItemModel._();

  factory MenuItemModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data()!;
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
      priceInfo: PriceInfo(price: 0),
      createdAt: now,
      updatedAt: now,
      description: '',
      imageUrl: '',
    );
  }

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  String toFriendlyString() => 'menu item';
}
