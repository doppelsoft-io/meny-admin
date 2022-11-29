import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/infrastructure/users/user_model.dart';
import 'package:meny_core/meny_core.dart';

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
      throw CustomException(message: 'Creating user failed. ${err.toString()}');
    }
  }
}
