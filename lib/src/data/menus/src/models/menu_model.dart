import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory MenuModel({
    // ignore: invalid_annotation_target
    @JsonKey(ignore: true) String? id,
    required String name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MenuModel;

  const MenuModel._();

  factory MenuModel.empty() {
    return const MenuModel(
      name: '',
      description: '',
    );
  }

  factory MenuModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data()!;
      final json = data as Map<String, dynamic>;

      return MenuModel.fromJson(json).copyWith(id: snap.id);
    } catch (err) {
      return MenuModel.empty();
    }
  }

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);

  String toFriendlyString() => 'menu';
}
