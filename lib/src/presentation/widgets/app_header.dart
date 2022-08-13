import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
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
            GoRouter.of(context).go('/');
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
                  GoRouter.of(context).go('/');
                },
                child: DSText.headline4(
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
            // context.read<MenusCubit>().close();
            // context.read<CategoriesCubit>().close();
            // context.read<MenuItemsCubit>().close();
            // context.read<ModifierGroupsCubit>().close();
            context.read<AuthCubit>().logout();

            Locator.instance<ToastService>().showNotification(
              const Text('Logged out!'),
            );
          },
          icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
        );
      },
      orElse: () {
        return Visibility(
          visible:
              GoRouter.of(context).location != '/${LoginScreen.routeName}' &&
                  GoRouter.of(context).location != '/${SignupScreen.routeName}',
          child: TextButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(LoginScreen.routeName);
            },
            child: DSText.subtitle1(
              'Log in',
              styleOverrides: TextStyle(
                color: Themes.colorScheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
