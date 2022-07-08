import 'package:go_router/go_router.dart';

import 'package:meny_admin/src/screens/screens.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: LoginScreen.routeName,
      path: '/${LoginScreen.routeName}',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      name: SignupScreen.routeName,
      path: '/${SignupScreen.routeName}',
      builder: (context, state) {
        return const SignupScreen();
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const AppScreen();
      },
      routes: [
        GoRoute(
          name: EditMenuScreen.routeName,
          path: 'menus/:id',
          builder: (context, state) {
            return EditMenuScreen(id: state.params['id']!);
          },
        ),
        // GoRoute(
        //   name: EditMenuScreen.routeName,
        //   path: 'menus/:id/preview',
        //   builder: (context, state) {
        //     return EditMenuScreen(id: state.params['id']!);
        //   },
        // ),
        GoRoute(
          name: EditCategoryScreen.routeName,
          path: 'categories/:id',
          builder: (context, state) {
            return EditCategoryScreen(id: state.params['id']!);
          },
        ),
        GoRoute(
          name: EditMenuItemScreen.routeName,
          path: 'items/:id',
          builder: (context, state) {
            return EditMenuItemScreen(id: state.params['id']!);
          },
        ),
        GoRoute(
          name: EditModifierGroupScreen.routeName,
          path: 'modifier-groups/:id',
          builder: (context, state) {
            return EditModifierGroupScreen(id: state.params['id']!);
          },
        ),
      ],
    ),
  ],
);
