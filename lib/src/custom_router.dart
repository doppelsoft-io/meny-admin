import 'package:flutter/material.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/presentation/menus/tags/widgets/update_tag_sheet.dart';
import 'package:meny_admin/src/presentation/sheet_args.dart';
import 'package:meny_admin/src/screens/screens.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<Widget>(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const Scaffold(),
        );
      case SplashScreen.routeName:
        return SplashScreen.route();
      case AppScreen.routeName:
        return AppScreen.route();
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case UpdateMenusSheet.routeName:
        return UpdateMenusSheet.route(settings.arguments! as SheetArgs);
      case UpdateCategorySheet.routeName:
        return UpdateCategorySheet.route(settings.arguments! as SheetArgs);
      case UpdateMenuItemSheet.routeName:
        return UpdateMenuItemSheet.route(settings.arguments! as SheetArgs);
      case UpdateModifierGroupSheet.routeName:
        return UpdateModifierGroupSheet.route(settings.arguments! as SheetArgs);
      case UpdateTagSheet.routeName:
        return UpdateTagSheet.route(settings.arguments! as SheetArgs);
      case MenuPreviewScreen.routeName:
        return MenuPreviewScreen.route(
          settings.arguments! as MenuPreviewScreenArgs,
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute<Widget>(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
