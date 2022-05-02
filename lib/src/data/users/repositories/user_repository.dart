import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/users/models/models.dart';
import 'package:meny/src/extensions/extensions.dart';

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
