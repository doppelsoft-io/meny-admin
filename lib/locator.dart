import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meny/src/constants/paths.dart';
import 'package:meny/src/data/auth/auth.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/category_menu_items/category_menu_items.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/menu_categories/menu_categories.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/data/users/users.dart';
import 'package:meny/src/services/services.dart';

class Locator {
  const Locator._();

  static GetIt instance = GetIt.instance;

  static Future<void> setup() async {
    instance.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
    instance.registerSingleton<FirebaseFunctions>(FirebaseFunctions.instance);
    instance.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
    instance.registerSingleton<StoreCacheService>(StoreCacheService());
    instance.registerSingleton<LoggerService>(const LoggerService());
    instance.registerSingleton<AuthRepository>(AuthRepository(
      loggerService: const LoggerService(prepend: 'AuthRepository'),
    ),);
    instance.registerSingleton<UserRepository>(UserRepository());

    instance.registerSingleton<StoreRepository>(
      StoreRepository(
        loggerService: const LoggerService(prepend: 'StoreRepository'),
      ),
    );

    instance.registerSingleton<MenuRepository>(
      MenuRepository(
        path: Paths.menus,
        firebaseFirestore: instance(),
        loggerService: const LoggerService(prepend: 'MenuRepository'),
      ),
    );
    instance.registerSingleton<CategoryRepository>(CategoryRepository(
      path: Paths.categories,
      firebaseFirestore: instance(),
      loggerService: const LoggerService(prepend: 'CategoryRepository'),
    ),);
    instance.registerSingleton<MenuItemRepository>(MenuItemRepository(
      path: Paths.menuItems,
      firebaseFirestore: instance(),
      loggerService: const LoggerService(prepend: 'MenuItemRepository'),
    ),);
    instance.registerSingleton<CompiledMenuRepository>(CompiledMenuRepository(
      firebaseFirestore: instance(),
    ),);
    instance.registerSingleton<MenuCategoryRepository>(MenuCategoryRepository(
      firebaseFirestore: instance(),
    ),);
    instance.registerSingleton<CategoryMenuItemsRepository>(
        CategoryMenuItemsRepository(
      firebaseFirestore: instance(),
    ),);
  }
}
