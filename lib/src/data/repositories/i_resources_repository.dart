import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meny_admin/src/data/core/failures.dart';

abstract class IResourcesRepository<T> {
  IResourcesRepository({
    required this.path,
    required this.firebaseFirestore,
  });

  String path;
  FirebaseFirestore firebaseFirestore;

  Stream<List<T>> getAll({required String storeId});
  Future<Either<Failure, T>> create({
    required String storeId,
    required T resource,
  });
  Future<Either<Failure, bool>> update({
    required String storeId,
    required T resource,
  });
  Future<Either<Failure, bool>> delete({
    required String storeId,
    required T resource,
  });
}
