import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_core/meny_core.dart';

abstract class IResourcesRepository<T> {
  IResourcesRepository({
    required this.path,
    required this.firebaseFirestore,
  });

  String path;
  FirebaseFirestore firebaseFirestore;

  Stream<List<T>> getAll({
    required String storeId,
    required OrderBy orderBy,
  });
  Future<T> create({
    required String storeId,
    required T resource,
  });
  Future<void> update({
    required String storeId,
    required T resource,
  });
  Future<void> delete({
    required String storeId,
    required T resource,
  });
}
