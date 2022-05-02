import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class StoreModel with _$StoreModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory StoreModel({
    // ignore: invalid_annotation_target
    @JsonKey(ignore: true) String? id,
    required String name,
    required List<String> users,
    required Map<String, String> roles,
    required DateTime createdAt,
  }) = _StoreModel;

  const StoreModel._();

  factory StoreModel.empty() {
    return StoreModel(
      name: '',
      users: const [],
      roles: {},
      createdAt: DateTime.now(),
    );
  }

  factory StoreModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data();
      final json = data as Map<String, dynamic>;
      return StoreModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return StoreModel.empty();
    }
  }

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}
