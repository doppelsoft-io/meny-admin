import 'package:hive_flutter/hive_flutter.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/services/services.dart';

class StoreCacheService {
  Future<void> save(String storeId) async {
    try {
      await Hive.box(HiveService.storesBox).put('storeId', storeId);
    } catch (err) {
      throw Failure(message: 'Failed to save store');
    }
  }

  Future<void> remove(String key) async {
    try {
      await Hive.box(HiveService.storesBox).delete(key);
    } catch (err) {
      throw Failure(message: 'Failed to remove storeId');
    }
  }

  Future<String> get(String storeId) async {
    try {
      final id = await Hive.box(HiveService.storesBox).get(storeId) as String;
      return id;
    } catch (err) {
      throw Failure(message: 'Failed to retrieve store');
    }
  }
}
