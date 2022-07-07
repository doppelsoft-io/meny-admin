import 'package:auto_route/auto_route.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meny_admin/app_router_web.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/auth/auth.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/themes.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeState = context.watch<StoreCubit>().state;
    const defaultTitle = 'meny';
    final title = storeState.maybeWhen(
      loaded: (store) => store.name.isEmpty ? defaultTitle : store.name,
      orElse: () => defaultTitle,
    );

    return ScreenTypeLayout(
      mobile: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            AutoRouter.of(context).pushAndPopUntil(
              const AppScreenRoute(),
              predicate: (Route<dynamic> route) => false,
            );
          },
          child: Text(title),
        ),
        centerTitle: false,
        actions: const [
          Center(child: AuthActions()),
        ],
      ),
      desktop: Material(
        color: Themes.colorScheme.onPrimary,
        elevation: 1,
        child: Container(
          height: 76,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pushAndPopUntil(
                    const AppScreenRoute(),
                    predicate: (Route<dynamic> route) => false,
                  );
                },
                child: DText.headline4(
                  title,
                  styleOverrides: TextStyle(
                    color: Themes.colorScheme.primary,
                  ),
                ),
              ),
              const Spacer(),
              const AuthActions(),
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

    return authState.maybeWhen(
      authenticated: (_) {
        return IconButton(
          onPressed: () {
            context.read<AuthCubit>().logout();

            Locator.instance<ToastService>().showNotification(
              const Text('Logged out!'),
            );
          },
          icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
        );
      },
      orElse: () {
        return TextButton(
          onPressed: () {
            AutoRouter.of(context).push(const LoginScreenRoute());
          },
          child: DText.subtitle1(
            'Log in',
            styleOverrides: TextStyle(
              color: Themes.colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}
