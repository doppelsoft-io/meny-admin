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
    instance
      ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
      ..registerSingleton<FirebaseFunctions>(FirebaseFunctions.instance)
      ..registerSingleton<FirebaseAuth>(FirebaseAuth.instance)
      ..registerSingleton<StoreCacheService>(StoreCacheService())
      ..registerSingleton<LoggerService>(const LoggerService())
      ..registerSingleton<AuthRepository>(
        AuthRepository(
          loggerService: const LoggerService(prepend: 'AuthRepository'),
        ),
      )
      ..registerSingleton<UserRepository>(UserRepository())
      ..registerSingleton<StoreRepository>(
        StoreRepository(
          loggerService: const LoggerService(prepend: 'StoreRepository'),
        ),
      )
      ..registerSingleton<MenuRepository>(
        MenuRepository(
          path: Paths.menus,
          firebaseFirestore: instance(),
          loggerService: const LoggerService(prepend: 'MenuRepository'),
        ),
      )
      ..registerSingleton<CategoryRepository>(
        CategoryRepository(
          path: Paths.categories,
          firebaseFirestore: instance(),
          loggerService: const LoggerService(prepend: 'CategoryRepository'),
        ),
      )
      ..registerSingleton<MenuItemRepository>(
        MenuItemRepository(
          path: Paths.menuItems,
          firebaseFirestore: instance(),
          loggerService: const LoggerService(prepend: 'MenuItemRepository'),
        ),
      )
      ..registerSingleton<CompiledMenuRepository>(
        CompiledMenuRepository(
          firebaseFirestore: instance(),
        ),
      )
      ..registerSingleton<MenuCategoryRepository>(
        MenuCategoryRepository(
          firebaseFirestore: instance(),
        ),
      )
      ..registerSingleton<CategoryMenuItemsRepository>(
        CategoryMenuItemsRepository(
          firebaseFirestore: instance(),
        ),
      );
  }
}
