import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get_it/get_it.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';

class Locator {
  const Locator._();

  static GetIt instance = GetIt.instance;

  static Future<void> setup() async {
    instance.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
    instance.registerSingleton<FirebaseFunctions>(FirebaseFunctions.instance);
    instance.registerSingleton<MenuRepository>(MenuRepository(
      path: Paths.menus,
      firebaseFirestore: instance(),
    ));
    instance.registerSingleton<CategoryRepository>(CategoryRepository(
      path: Paths.categories,
      firebaseFirestore: instance(),
    ));
    instance.registerSingleton<MenuItemRepository>(MenuItemRepository(
      path: Paths.menuItems,
      firebaseFirestore: instance(),
    ));
    instance.registerSingleton<CompiledMenuRepository>(CompiledMenuRepository(
      firebaseFirestore: instance(),
    ));
  }
}
