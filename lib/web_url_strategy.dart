import 'package:go_router/go_router.dart';

void configureUrl() {
  // setUrlStrategy(PathUrlStrategy());
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
}
