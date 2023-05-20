import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/themes.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context).location;
    final onAuthScreens = route.contains(LoginScreen.routeName) ||
        route.contains(SignupScreen.routeName);

    return ScreenTypeLayout.builder(
      mobile: (_) => Material(
        color: Colors.white,
        elevation: 1,
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: DSSpacing.sm,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Locator.instance<NavigatorHelper>().goHome(),
                child: DSText(
                  getValueForScreenType(
                    context: context,
                    mobile: 'm',
                    desktop: 'meny',
                  ),
                  theme: DSTextThemeData.h1(
                    color: effectiveTheme.colorScheme.primary,
                  ),
                ),
              ),
              if (!onAuthScreens) ...[
                const Spacer(),
                const Center(child: AuthActions()),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AuthActions extends HookWidget {
  const AuthActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final route = GoRouter.of(context).location;
    final onAuthScreens = route.contains(LoginScreen.routeName) ||
        route.contains(SignupScreen.routeName);

    return authState.maybeWhen(
      unauthenticated: (_) {
        return Visibility(
          visible: !onAuthScreens,
          child: DSButton(
            onPressed: () {
              Locator.instance<NavigatorHelper>()
                  .goNamed(SignupScreen.routeName);
            },
            text: 'Create an account',
          ),
        );
      },
      orElse: SizedBox.shrink,
    );
  }
}
