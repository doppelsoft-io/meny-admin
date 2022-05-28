import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';

abstract class IResourcesRepository<T> {
  IResourcesRepository({
    required this.path,
    required this.firebaseFirestore,
  });

  String path;
  FirebaseFirestore firebaseFirestore;

  Stream<List<T>> getAll({required String storeId});
  Future<Either<CustomException, T>> create({
    required String storeId,
    required T resource,
  });
  Future<Either<CustomException, bool>> update({
    required String storeId,
    required T resource,
  });
  Future<Either<CustomException, bool>> delete({
    required String storeId,
    required T resource,
  });
}
