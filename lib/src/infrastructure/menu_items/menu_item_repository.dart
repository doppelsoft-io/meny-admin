import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/extensions/extensions.dart';
import 'package:meny_admin/src/infrastructure/i_resources_repository.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class GetMenuItemException extends CustomException {
  const GetMenuItemException({String? message}) : super(message: message);
}

class CreateMenuItemException extends CustomException {
  const CreateMenuItemException({String? message}) : super(message: message);
}

class UpdateMenuItemException extends CustomException {
  const UpdateMenuItemException({String? message}) : super(message: message);
}

class DeleteMenuItemException extends CustomException {
  const DeleteMenuItemException({String? message}) : super(message: message);
}

class MenuItemRepository extends IResourcesRepository<MenuItemModel> {
  MenuItemRepository({
    String? path,
    FirebaseFirestore? firebaseFirestore,
    required LoggerService loggerService,
    UuidService? uuidService,
  })  : _loggerService = loggerService,
        _uuidService = uuidService ?? Locator.instance(),
        super(
          path: path ?? Paths.menuItems,
          firebaseFirestore: firebaseFirestore ?? FirebaseFirestore.instance,
        );

  final LoggerService _loggerService;
  final UuidService _uuidService;

  Future<MenuItemModel> get({
    required String storeId,
    required String id,
  }) async {
    try {
      final snap = await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: id)
          .get();
      return MenuItemModel.fromSnapshot(snap);
    } catch (err) {
      _loggerService.log('(get): ${err.toString()}');
      throw const GetMenuItemException(message: 'Failed to retrieve item');
    }
  }

  @override
  Stream<List<MenuItemModel>> getAll({
    required String storeId,
    required OrderBy orderBy,
  }) {
    return firebaseFirestore
        .menuItemEntitiesCollection(storeId: storeId)
        .orderBy(orderBy.field, descending: orderBy.descending)
        .snapshots()
        .map(
          (doc) => doc.docs.map(MenuItemModel.fromSnapshot).toList(),
        );
  }

  Stream<List<MenuItemModel>> getAllByType({
    required String storeId,
    MenuItemType type = MenuItemType.item,
  }) {
    return firebaseFirestore
        .menuItemEntitiesCollection(storeId: storeId)
        .where('type', isEqualTo: type.stringify())
        .snapshots()
        .map(
          (doc) => doc.docs.map(MenuItemModel.fromSnapshot).toList(),
        );
  }

  @override
  Future<MenuItemModel> create({
    required String storeId,
    required MenuItemModel resource,
  }) async {
    try {
      final document = firebaseFirestore
          .menuItemEntitiesCollection(storeId: storeId)
          .doc(_uuidService.uuid);

      await document.set(resource.toJson());

      final snapshot = await document.get();
      return MenuItemModel.fromSnapshot(snapshot);
    } catch (err) {
      _loggerService.log('(create): ${err.toString()}');
      throw CreateMenuItemException(
        message:
            'We had an issue creating your ${resource.toFriendlyString()}. Please try again later.',
      );
    }
  }

  @override
  Future<void> update({
    required String storeId,
    required MenuItemModel resource,
  }) async {
    try {
      await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: resource.id!)
          .set(
            resource.copyWith(updatedAt: DateTime.now()).toJson(),
            SetOptions(merge: true),
          );
    } catch (err) {
      _loggerService.log('(update): ${err.toString()}');
      throw UpdateMenuItemException(
        message:
            'We had trouble saving your ${resource.toFriendlyString()}. Please try again later.',
      );
    }
  }

  @override
  Future<void> delete({
    required String storeId,
    required MenuItemModel resource,
  }) async {
    try {
      await firebaseFirestore
          .menuItemEntitiesDocument(storeId: storeId, itemId: resource.id!)
          .delete();
    } catch (err) {
      _loggerService.log('(delete): ${err.toString()}');
      throw DeleteMenuItemException(
        message:
            'There was an issue deleting your ${resource.toFriendlyString()}. Please try again later.',
      );
    }
  }
}
