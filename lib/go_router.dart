import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

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
          name: CreateMenuScreen.routeName,
          path: 'create-menu',
          pageBuilder: (_, state) => const MaterialPage(
            fullscreenDialog: true,
            child: CreateMenuScreen(),
          ),
        ),
        GoRoute(
          name: EditMenuScreen.routeName,
          path: 'menus/:id',
          builder: (_, state) => EditMenuScreen(id: state.params['id']!),
        ),
        GoRoute(
          name: MenuPreviewScreen.routeName,
          path: 'menus/:id/preview',
          builder: (context, state) {
            return MenuPreviewScreen(id: state.params['id']!);
          },
        ),
        GoRoute(
          name: CreateCategoryScreen.routeName,
          path: 'create-category',
          pageBuilder: (_, state) => const MaterialPage(
            fullscreenDialog: true,
            child: CreateCategoryScreen(),
          ),
        ),
        GoRoute(
          name: EditCategoryScreen.routeName,
          path: 'categories/:id',
          builder: (context, state) {
            return EditCategoryScreen(id: state.params['id']!);
          },
        ),
        GoRoute(
          name: CreateMenuItemScreen.routeName,
          path: 'create-item',
          pageBuilder: (_, state) => const MaterialPage(
            fullscreenDialog: true,
            child: CreateMenuItemScreen(),
          ),
        ),
        GoRoute(
          name: EditMenuItemScreen.routeName,
          path: 'items/:id',
          builder: (context, state) {
            return EditMenuItemScreen(id: state.params['id']!);
          },
        ),
        GoRoute(
          name: CreateModifierGroupScreen.routeName,
          path: 'create-modifier-group',
          pageBuilder: (_, state) => const MaterialPage(
            fullscreenDialog: true,
            child: CreateModifierGroupScreen(),
          ),
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
  // redirect: (state) {
  //   print('state $state');
  //   return null;
  // },
  errorBuilder: (context, state) => ErrorScreen(state.error!),
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {Key? key}) : super(key: key);
  final Exception error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('My "Page Not Found" Screen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(error.toString()),
              TextButton(
                onPressed: () => context.go('/'),
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      );
}
