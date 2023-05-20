import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/infrastructure/stores/store_roles.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class StoreRepository {
  StoreRepository({
    FirebaseFirestore? firebaseFirestore,
    required LoggerService loggerService,
  })  : _firebaseFirestore = firebaseFirestore ?? Locator.instance(),
        _loggerService = loggerService;

  final FirebaseFirestore _firebaseFirestore;
  final LoggerService _loggerService;

  Stream<StoreModel> stream({
    required String storeId,
  }) {
    return _firebaseFirestore
        .storesDocument(storeId: storeId)
        .snapshots()
        .map((snapshot) {
      return StoreModel.fromSnapshot(snapshot);
    });
  }

  Future<Either<CustomException, StoreModel>> get({
    required String storeId,
  }) async {
    try {
      final snap =
          await _firebaseFirestore.storesDocument(storeId: storeId).get();
      return right(StoreModel.fromSnapshot(snap));
    } catch (err) {
      _loggerService.log('(get): $err');
      return left(const CustomException(message: 'Failed to retrieve store'));
    }
  }

  Future<Either<CustomException, List<StoreModel>>> getStoresForUser({
    required String userId,
  }) async {
    try {
      final storeDocuments = await _firebaseFirestore
          .storesCollection()
          .where('users', arrayContains: userId)
          .get();

      final stores = storeDocuments.docs.map(StoreModel.fromSnapshot).toList();

      return right(stores);
    } catch (err) {
      _loggerService.log('(getStoresForUser): $err');
      return left(const CustomException(message: 'Failed to retrieve store'));
    }
  }

  Future<StoreModel> createEmptyStoreForUser({
    required String userId,
    StoreModel? store,
  }) async {
    return _createEmptyStoreForUser(
      userId: userId,
      store: store ?? StoreModel.empty(),
    );
  }

  Future<StoreModel> _createEmptyStoreForUser({
    required String userId,
    required StoreModel store,
  }) async {
    try {
      final newStore = store.copyWith(
        owner: userId,
        users: [userId],
        roles: {
          userId: StoreRole.owner.asString(),
        },
      );
      print('MEE: newStore $newStore');
      final document =
          await _firebaseFirestore.storesCollection().add(newStore.toJson());
      final snapshot = await document.get();
      return StoreModel.fromSnapshot(snapshot);
    } catch (err) {
      _loggerService.log('(createEmptyStoreForUser): $err');
      throw const CustomException(message: 'Failed to create store');
    }
  }

  Future<void> update({required StoreModel store}) async {
    try {
      await _firebaseFirestore
          .storesCollection()
          .doc(store.id)
          .update(store.toJson());
    } catch (err) {
      _loggerService.log('(update): $err');
      throw const CustomException(message: 'Failed to update store.');
    }
  }
}
