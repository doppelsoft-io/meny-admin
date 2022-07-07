import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/auth/auth.dart';
import 'package:meny_admin/src/data/stores/cubits/cubits.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/tabs.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AppScreen();
  }
}

class _AppScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState<int>(0);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return BlocConsumer<StoreCubit, StoreState>(
          listenWhen: (prev, curr) => prev.store != curr.store,
          listener: (context, storeState) {
            storeState.maybeWhen(
              error: (store, exception) {
                DialogService.showErrorDialog(
                  context: context,
                  failure: CustomException(message: exception.toString()),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, storeState) {
            return storeState.maybeWhen(
              loading: (_) => const Scaffold(
                body: LoadingDisplay(
                  alignment: Alignment.center,
                ),
              ),
              error: (_, exception) => Scaffold(
                body: ErrorDisplay(
                  exception: CustomException(message: exception.toString()),
                ),
              ),
              loaded: (store) {
                final pages = tabs.map((e) => e.value4).toList();
                return ScreenTypeLayout(
                  mobile: Scaffold(
                    appBar: const PreferredSize(
                      preferredSize: Size.fromHeight(kToolbarHeight),
                      child: AppHeader(),
                    ),
                    body: pages[_selectedIndex.value],
                  ),
                  desktop: Scaffold(
                    appBar: const PreferredSize(
                      preferredSize: Size.fromHeight(76),
                      child: AppHeader(),
                    ),
                    body: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: NavigationRail(
                            extended: getValueForScreenType<bool>(
                              context: context,
                              mobile: false,
                              tablet: true,
                            ),
                            selectedIndex: _selectedIndex.value,
                            onDestinationSelected: (value) {
                              _selectedIndex.value = value;
                              // tabsRouter.setActiveIndex(value);
                              ActionService.run(
                                () => _selectedIndex.value = value,
                                () => AnalyticsService.track(
                                  message: Analytics.tabTapped,
                                  params: {
                                    'tab': pages[value].toString(),
                                  },
                                ),
                              );
                            },
                            destinations: tabs
                                .map(
                                  (tuple) => NavigationRailDestination(
                                    icon: Icon(tuple.value1),
                                    selectedIcon: Icon(tuple.value2),
                                    label: Text(tuple.value3),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        VerticalDivider(
                          width: 3,
                          color: Colors.grey[200],
                          thickness: 7,
                        ),
                        Expanded(child: pages[_selectedIndex.value]),
                      ],
                    ),
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
