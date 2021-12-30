import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/models/resources/i_resource_model.dart';
import 'package:meny/src/data/repositories/i_resources_repository.dart';

class ResourcesRepository<T extends IResourceModel>
    extends IResourcesRepository<T> {
  T fromSnapshot(DocumentSnapshot snap) {
    if (T == IResourceModel) {
      throw Failure(
        message: 'ResourcesRepository: T not provided',
        shortMessage: 'ResourcesRepository: T not provided',
      );
    }

    switch (T) {
      case MenuEntity:
        return MenuEntity.fromSnapshot(snap) as T;
      case MenuModel:
        return MenuModel.fromSnapshot(snap) as T;
      case CategoryModel:
        return CategoryModel.fromSnapshot(snap) as T;
      case CategoryEntity:
        return CategoryEntity.fromSnapshot(snap) as T;
      case MenuItemModel:
        return MenuItemModel.fromSnapshot(snap) as T;
      default:
        throw Failure(message: 'ResourcesRepository: you must provide a $T');
    }
  }

  ResourcesRepository({
    required path,
    FirebaseFirestore? firebaseFirestore,
  }) : super(
          path: path,
          firebaseFirestore: firebaseFirestore ?? FirebaseFirestore.instance,
        );

  @override
  Stream<List<T>> getAll() {
    if (T == IResourceModel) {
      return Stream.error('Failed to provide T');
    }

    return firebaseFirestore
        .collection(path)
        .snapshots()
        .map((doc) => doc.docs.map((snap) => fromSnapshot(snap)).toList());
  }

  @override
  Future<Either<Failure, T>> create({required T resource}) async {
    try {
      final document =
          await firebaseFirestore.collection(path).add(resource.toJson());
      final snapshot = await document.get();
      return right(fromSnapshot(snapshot));
    } catch (e) {
      return left(Failure(
        message:
            "We had an issue creating your ${T.runtimeType}. Please try again later.",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> update({required T resource}) async {
    try {
      await firebaseFirestore
          .collection(path)
          .doc(resource.id)
          .set(resource.toJson(), SetOptions(merge: true));
      return right(true);
    } catch (e) {
      return left(Failure(
        message:
            'We had trouble updating your ${resource.toFriendlyString()}. Please try again later.',
        shortMessage: 'Update failed.',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> delete({required T resource}) async {
    try {
      await firebaseFirestore.collection(path).doc(resource.id).delete();
      return right(true);
    } catch (e) {
      return left(Failure(
        message:
            'There was an issue deleting your ${resource.toFriendlyString()}. Please try again later.',
        shortMessage: 'Delete failed',
      ));
    }
  }
}
