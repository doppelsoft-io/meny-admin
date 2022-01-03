import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StoreModel extends Equatable {
  @JsonKey(ignore: true)
  final String? id;
  final String name;
  final List<String> users;
  final Map<String, String> roles;
  final DateTime createdAt;

  const StoreModel({
    this.id,
    required this.name,
    required this.users,
    required this.roles,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, users, roles, createdAt];

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
      final Object? data = snap.data();
      final json = (data as Map<String, dynamic>);
      return StoreModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return StoreModel.empty();
    }
  }

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);

  StoreModel copyWith({
    String? id,
    String? name,
    List<String>? users,
    Map<String, String>? roles,
    DateTime? createdAt,
  }) {
    return StoreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      users: users ?? this.users,
      roles: roles ?? this.roles,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
