import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/core/failures.dart';
import 'package:meny_admin/src/data/users/users.dart';
import 'package:meny_admin/src/extensions/extensions.dart';

class UserRepository {
  UserRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? Locator.instance();

  final FirebaseFirestore _firebaseFirestore;

  Future<UserModel> create({required UserModel user}) async {
    try {
      await _firebaseFirestore
          .usersDocument(userId: user.id!)
          .set(user.toJson());
      return user;
    } catch (err) {
      throw Failure(message: 'Creating user failed. ${err.toString()}');
    }
  }
}
