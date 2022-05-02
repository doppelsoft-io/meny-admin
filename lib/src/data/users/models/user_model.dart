import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    String? id,
    required String email,
    required bool isAnonymous,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.empty() {
    return const UserModel(
      id: '',
      email: '',
      isAnonymous: false,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    try {
      final data = snap.data();
      final json = data as Map<String, dynamic>;
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
}
