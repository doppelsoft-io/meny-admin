import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/app/app_constants.dart';
import 'package:meny_admin/src/app/feature_flag_constants.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/paths.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class Locator {
  const Locator._();

  static GetIt instance = GetIt.instance;

  static Future<void> setup({required AppEnvironment environment}) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    final flagsmithClient = await FlagsmithClient.init(
      apiKey: dotenv.get(AppConstants.flagsmithEnvironmentKey),
      config: const FlagsmithConfig(),
      seeds: [
        Flag.seed(FeatureFlags.modifierGroupManagement, enabled: false),
        Flag.seed(FeatureFlags.storeManagement, enabled: false),
      ],
    );

    instance
      ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
      ..registerSingleton<NavigatorHelper>(NavigatorHelper())
      ..registerSingleton<FlagsmithClient>(flagsmithClient)
      ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
      ..registerSingleton<FirebaseFunctions>(FirebaseFunctions.instance)
      ..registerSingleton<FirebaseAuth>(FirebaseAuth.instance)
      ..registerSingleton<FirebaseStorage>(FirebaseStorage.instance)
      ..registerSingleton<LoggerService>(const LoggerService())
      ..registerSingleton<UuidService>(UuidService())
      ..registerSingleton<ToastService>(const ToastService())
      ..registerSingleton<IAnalyticsService>(const AnalyticsService())
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
      )
      ..registerSingleton<ModifierGroupRepository>(
        ModifierGroupRepository(
          loggerService: const LoggerService(
            prepend: 'ModifierGroupRepository',
          ),
        ),
      )
      ..registerSingleton<MenuItemModifierGroupRepository>(
        MenuItemModifierGroupRepository(),
      )
      ..registerSingleton<ModifierGroupItemRepository>(
        ModifierGroupItemRepository(),
      )
      ..registerSingleton<AuthCubit>(AuthCubit())
      ..registerSingleton<FlagsmithCubit>(
        FlagsmithCubit(authCubit: instance()),
      );
  }
}
