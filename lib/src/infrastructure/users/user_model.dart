import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_core/meny_core.dart' as meny_core
    show DocumentSnapshot, User;

part 'user_model.g.dart';
part 'user_model.freezed.dart';

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

  factory UserModel.fromSnapshot(meny_core.DocumentSnapshot snap) {
    try {
      final data = snap.data()!;
      final json = data as Map<String, dynamic>;
      return UserModel.fromJson(json).copyWith(id: snap.id);
    } catch (e) {
      return UserModel.empty();
    }
  }

  factory UserModel.fromFirebaseAuthUser(meny_core.User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      isAnonymous: user.isAnonymous,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
