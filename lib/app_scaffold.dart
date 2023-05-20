import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/tabs.dart';
import 'package:tabler_icons/tabler_icons.dart';

class AppScaffold extends HookWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;

    return authState.maybeWhen(
      authenticated: (user) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              getValueForScreenType<double>(
                context: context,
                mobile: kToolbarHeight,
                desktop: 76,
              ),
            ),
            child: const AppHeader(),
          ),
          body: Builder(
            builder: (context) {
              final storeState = context.watch<StoreCubit>().state;
              return storeState.maybeWhen(
                loaded: (store) => ScaffoldBody(child: child),
                orElse: () => const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        );
      },
      unauthenticated: (_) => const Scaffold(
        body: LoginScreen(),
      ),
      orElse: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ScaffoldBody extends HookWidget {
  const ScaffoldBody({super.key, required this.child});
  final Widget child;

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t.routePath));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(
    BuildContext context,
    int tabIndex,
    ValueNotifier<int> currentIndex,
  ) {
    if (tabIndex != currentIndex.value) {
      // go to the initial location of the selected tab (by index)

      currentIndex.value = tabIndex;
      context.go(tabs[tabIndex].routePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        useState<int>(_locationToTabIndex(GoRouter.of(context).location));
    return Row(
      children: [
        Column(
          children: [
            Expanded(
              child: NavigationRail(
                selectedIndex: currentIndex.value,
                useIndicator: false,
                extended: getValueForScreenType(
                  context: context,
                  mobile: false,
                  desktop: true,
                ),
                onDestinationSelected: (index) =>
                    _onItemTapped(context, index, currentIndex),
                destinations: tabs
                    .map(
                      (tab) => NavigationRailDestination(
                        icon: Icon(tab.inactiveIcon ?? tab.activeIcon),
                        selectedIcon: Icon(tab.activeIcon),
                        label: DSText(
                          tab.label,
                          theme: const DSTextThemeData.b4(),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: kToolbarHeight,
              child: DSButton(
                theme: const DSButtonThemeData.text(),
                icon: const Icon(TablerIcons.logout),
                text: 'Sign Out',
                onPressed: () {
                  context.read<AuthCubit>().logout();

                  Locator.instance<ToastService>().init(
                    const DSToast.notification(text: 'Logged out!'),
                  );
                },
              ),
            ),
          ],
        ),
        VerticalDivider(
          width: 3,
          color: Colors.grey[200],
          thickness: 7,
        ),
        Expanded(child: child),
      ],
    );
  }
}
