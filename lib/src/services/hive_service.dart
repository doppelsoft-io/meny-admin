import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveService {
  const HiveService._();

  static const String storesBox = 'stores';

  static List<String> get boxes => [
        storesBox,
      ];

  static Future<void> configure() async {
    await Hive.initFlutter();
    try {
      for (final box in boxes) {
        await Hive.openBox(box);
      }
    } catch (err) {
      for (final box in boxes) {
        await Hive.deleteBoxFromDisk(box);
        await Hive.openBox(box);
      }
    }
  }
}
