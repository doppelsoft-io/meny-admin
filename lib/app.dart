import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/themes.dart';

class App extends StatelessWidget {
  App({
    Key? key,
    required this.environment,
  }) : super(key: key);

  final authCubit = Locator.instance<AuthCubit>();
  final storeCubit = Locator.instance<StoreCubit>();

  final AppEnvironment environment;

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
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
      GoRoute(
        path: '/',
        builder: (_, state) => const AppScreen(),
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
    redirect: (state) {
      final location = state.subloc;
      final onLogin = location == '/${LoginScreen.routeName}';
      final onSignup = location == '/${SignupScreen.routeName}';
      final onAuth = onLogin || onSignup;

      return authCubit.state.maybeWhen(
        initial: (_) {
          return onAuth ? null : '/login';
        },
        unauthenticated: (_) {
          return onAuth ? null : '/login';
        },
        authenticated: (_) {
          return onAuth ? '/' : null;
        },
        anonymous: (_) {
          return null;
        },
        orElse: () {
          return onAuth ? null : '/login';
        },
      );
    },
    refreshListenable: GoRouterRefreshStream(
      authCubit.stream,
    ),
    errorBuilder: (_, state) => ErrorScreen(state.error!),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => authCubit..appStarted(),
          ),
          BlocProvider<StoreCubit>(
            create: (context) => storeCubit,
          ),
        ],
        child: MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          theme: Themes.defaultTheme,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(
              context,
              DSUnfocus(
                child: DSTextScaleFactorClamper(
                  child: DSUnfocus(child: widget!),
                ),
              ),
            ),
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {Key? key}) : super(key: key);
  final Exception error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
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
}
