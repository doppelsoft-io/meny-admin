import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meny/src/data/core/failures.dart';

abstract class IResourcesRepository<T> {
  String path;
  FirebaseFirestore firebaseFirestore;

  IResourcesRepository({
    required this.path,
    required this.firebaseFirestore,
  });

  Stream<List<T>> getAll();
  Future<Either<Failure, T>> create({required T resource});
  Future<Either<Failure, bool>> update({required T resource});
  Future<Either<Failure, bool>> delete({required T resource});
}
