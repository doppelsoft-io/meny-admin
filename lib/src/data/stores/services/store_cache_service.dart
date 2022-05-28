import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meny_admin/src/services/services.dart';

class StoreCacheService {
  Future<void> save(String storeId) async {
    try {
      await Hive.box(HiveService.storesBox).put('storeId', storeId);
    } catch (err) {
      throw const CustomException(message: 'Failed to save store');
    }
  }

  Future<void> remove(String key) async {
    try {
      await Hive.box(HiveService.storesBox).delete(key);
    } catch (err) {
      throw const CustomException(message: 'Failed to remove storeId');
    }
  }

  Future<String> get(String storeId) async {
    try {
      final id = await Hive.box(HiveService.storesBox).get(storeId) as String;
      return id;
    } catch (err) {
      throw const CustomException(message: 'Failed to retrieve store');
    }
  }
}
