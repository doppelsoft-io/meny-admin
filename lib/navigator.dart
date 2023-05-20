import 'package:go_router/go_router.dart';
import 'package:meny_admin/router.dart';

class NavigatorHelper {
  void goHome() => go('/d');

  void go(String routeName, {Object? extra}) {
    navigatorKey.currentState?.context.go(routeName, extra: extra);
  }

  void goNamed(
    String routeName, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    navigatorKey.currentState?.context.goNamed(
      routeName,
      params: params,
      queryParams: queryParams,
      extra: extra,
    );
  }

  void pop() => navigatorKey.currentState?.context.pop();

  void goToMenus() =>
      menuTabNavigatorKey.currentState?.context.goNamed('menus');

  void goToMenuItems() =>
      menuTabNavigatorKey.currentState?.context.goNamed('items');

  void goToCategories() =>
      menuTabNavigatorKey.currentState?.context.goNamed('categories');

  void goToModifierGroups() =>
      menuTabNavigatorKey.currentState?.context.goNamed('modifier-groups');
}
