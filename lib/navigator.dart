import 'package:go_router/go_router.dart';
import 'package:meny_admin/app.dart';

class NavigatorHelper {
  void goHome() => go('/');

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
}
