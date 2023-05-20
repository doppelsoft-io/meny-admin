import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/app_scaffold.dart';
import 'package:meny_admin/src/app/feature_flag_constants.dart';
import 'package:meny_admin/src/application/application.dart';

import 'package:meny_admin/src/presentation/presentation.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();
final menuTabNavigatorKey = GlobalKey<NavigatorState>();
final storeTabNavigatorKey = GlobalKey<NavigatorState>();
final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/d',
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        ShellRoute(
          navigatorKey: menuTabNavigatorKey,
          pageBuilder: (context, state, child) {
            final isModifierGroupsEnabled = context
                .read<FlagsmithCubit>()
                .isFeatureFlagEnabled(FeatureFlags.modifierGroupManagement);
            final tabs = [
              DSTabModel(label: 'Menus', routePath: 'menus'),
              DSTabModel(label: 'Categories', routePath: 'categories'),
              DSTabModel(label: 'Items', routePath: 'items'),
              if (isModifierGroupsEnabled)
                DSTabModel(
                  label: 'Modifier Groups',
                  routePath: 'modifier-groups',
                ),
            ];
            final flagsmithState = context.watch<FlagsmithCubit>().state;
            final foundIndex = tabs
                .indexWhere((tab) => state.location.contains(tab.routePath));
            final initialTabIndex = foundIndex > -1 ? foundIndex : 0;

            return NoTransitionPage(
              child: flagsmithState.maybeWhen(
                loaded: (_) => MenusScreen(
                  args: TabScreenArgs(
                    tabs: tabs,
                    initialTabIndex: initialTabIndex,
                    child: child,
                  ),
                ),
                orElse: SizedBox.shrink,
              ),
            );
          },
          routes: [
            GoRoute(
              name: 'dashboard',
              path: '/d',
              pageBuilder: (_, state) => const NoTransitionPage(
                child: MenusTab(),
              ),
              routes: [
                GoRoute(
                  name: 'menus',
                  path: 'menus',
                  pageBuilder: (_, state) => const NoTransitionPage(
                    child: MenusTab(),
                  ),
                  routes: [
                    GoRoute(
                      name: CreateMenuScreen.routeName,
                      path: 'create',
                      pageBuilder: (_, state) => const MaterialPage(
                        fullscreenDialog: true,
                        child: CreateMenuScreen(),
                      ),
                    ),
                    GoRoute(
                      name: EditMenuScreen.routeName,
                      path: ':id',
                      builder: (_, state) =>
                          EditMenuScreen(id: state.params['id']!),
                    ),
                  ],
                ),
                GoRoute(
                  name: 'categories',
                  path: 'categories',
                  pageBuilder: (_, state) =>
                      const NoTransitionPage(child: CategoriesTab()),
                  routes: [
                    GoRoute(
                      name: CreateCategoryScreen.routeName,
                      path: 'create',
                      pageBuilder: (_, state) => const MaterialPage(
                        fullscreenDialog: true,
                        child: CreateCategoryScreen(),
                      ),
                    ),
                    GoRoute(
                      name: EditCategoryScreen.routeName,
                      path: ':id',
                      builder: (context, state) {
                        return EditCategoryScreen(id: state.params['id']!);
                      },
                    ),
                  ],
                ),
                GoRoute(
                  name: 'items',
                  path: 'items',
                  pageBuilder: (_, state) =>
                      const NoTransitionPage(child: MenuItemsTab()),
                  routes: [
                    GoRoute(
                      name: CreateMenuItemScreen.routeName,
                      path: 'create',
                      pageBuilder: (_, state) => const MaterialPage(
                        fullscreenDialog: true,
                        child: CreateMenuItemScreen(),
                      ),
                    ),
                    GoRoute(
                      name: EditMenuItemScreen.routeName,
                      path: ':id',
                      builder: (context, state) {
                        return EditMenuItemScreen(id: state.params['id']!);
                      },
                    ),
                  ],
                ),
                GoRoute(
                  name: 'modifier-groups',
                  path: 'modifier-groups',
                  pageBuilder: (_, state) =>
                      const NoTransitionPage(child: ModifierGroupsTab()),
                  routes: [
                    GoRoute(
                      name: CreateModifierGroupScreen.routeName,
                      path: 'create',
                      pageBuilder: (_, state) => const MaterialPage(
                        fullscreenDialog: true,
                        child: CreateModifierGroupScreen(),
                      ),
                    ),
                    GoRoute(
                      name: EditModifierGroupScreen.routeName,
                      path: ':id',
                      builder: (context, state) {
                        return EditModifierGroupScreen(id: state.params['id']!);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        ShellRoute(
          navigatorKey: storeTabNavigatorKey,
          pageBuilder: (context, state, child) {
            final isStoreManagementEnabled = context
                .read<FlagsmithCubit>()
                .isFeatureFlagEnabled(FeatureFlags.storeManagement);
            final tabs = [
              DSTabModel(label: 'Details', routePath: 'store-details'),
              if (isStoreManagementEnabled) ...[
                DSTabModel(label: 'Hours', routePath: 'store-hours'),
                DSTabModel(label: 'Locations', routePath: 'store-locations'),
              ],
            ];
            final flagsmithState = context.watch<FlagsmithCubit>().state;
            final foundIndex = tabs.indexWhere((tab) {
              final route = tab.routePath.split('-')[1];
              return state.location.contains(route);
            });
            final initialTabIndex = foundIndex > -1 ? foundIndex : 0;

            return NoTransitionPage(
              child: flagsmithState.maybeWhen(
                orElse: SizedBox.shrink,
                loaded: (_) => MyStoreScreen(
                  args: TabScreenArgs(
                    child: child,
                    tabs: tabs,
                    initialTabIndex: initialTabIndex,
                  ),
                ),
              ),
            );
          },
          routes: [
            GoRoute(
              name: 'store',
              path: '/store',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: MyStoreDetailsTab()),
              routes: [
                GoRoute(
                  name: 'store-details',
                  path: 'details',
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: MyStoreDetailsTab());
                  },
                ),
                GoRoute(
                  name: 'store-hours',
                  path: 'hours',
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: MyStoreHoursTab());
                  },
                ),
                GoRoute(
                  name: 'store-locations',
                  path: 'locations',
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: MyStoreLocationsTab());
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: MenuPreviewScreen.routeName,
      path: '/menus/:id/preview',
      pageBuilder: (context, state) {
        return MaterialPage(
          fullscreenDialog: true,
          child: MenuPreviewScreen(id: state.params['id']!),
        );
      },
    ),
    GoRoute(
      name: SplashScreen.routeName,
      path: '/${SplashScreen.routeName}',
      builder: (_, state) => const SplashScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: '/${LoginScreen.routeName}',
      builder: (_, state) => const LoginScreen(),
    ),
    GoRoute(
      name: SignupScreen.routeName,
      path: '/${SignupScreen.routeName}',
      builder: (_, state) => const SignupScreen(),
    ),
  ],
);
