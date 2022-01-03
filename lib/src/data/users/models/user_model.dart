import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  @JsonKey(ignore: true)
  final String? id;
  final String email;
  final bool isAnonymous;
  const UserModel({
    this.id,
    required this.email,
    required this.isAnonymous,
  });

  @override
  List<Object?> get props => [id, email, isAnonymous];

  factory UserModel.empty() {
    return UserModel(
      id: '',
      email: '',
      isAnonymous: false,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final Object? data = snap.data();
      final json = (data as Map<String, dynamic>);
      return UserModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return UserModel.empty();
    }
  }

  factory UserModel.fromFirebaseAuthUser(auth.User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      isAnonymous: user.isAnonymous,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? email,
    bool? isAnonymous,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}
