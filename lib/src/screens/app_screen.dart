import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meny/src/constants/analytics.dart';
import 'package:meny/src/data/auth/auth.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/stores/cubits/cubits.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/customer/customers_page.dart';
import 'package:meny/src/presentation/locations/locations_page.dart';
import 'package:meny/src/presentation/menus/menus_page.dart';
import 'package:meny/src/presentation/orders/orders_page.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/presentation/store_hours/store_hours_page.dart';
import 'package:meny/src/screens/screens.dart';
import 'package:meny/src/services/services.dart';
import 'package:meny/tabs.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppScreen extends StatelessWidget {
  static const String routeName = '/app';

  static Route route() {
    return MaterialPageRoute<Widget>(
      builder: (_) => _AppScreen(),
    );
  }

  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
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
                  failure: Failure(message: exception.toString()),
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
                  failure: Failure(message: exception.toString()),
                ),
              ),
              loaded: (store) {
                const pages = {
                  0: MenusPage(),
                  1: OrdersPage(),
                  2: LocationsPage(),
                  3: StoreHoursPage(),
                  4: CustomersPage(),
                };
                return Scaffold(
                  appBar: AppBar(
                    elevation: 1,
                    automaticallyImplyLeading: false,
                    title: Text(store.name.isEmpty ? 'Meny' : store.name),
                    centerTitle: false,
                    actions: [
                      if (authState.user != null &&
                          authState.status == AuthStatus.authenticated) ...[
                        IconButton(
                          onPressed: () {
                            context.read<AuthCubit>().logout();
                            ToastService.showNotification(
                                const Text('Logged out!'),);
                          },
                          icon: const FaIcon(FontAwesomeIcons.signOutAlt),
                        ),
                      ] else ...[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(LoginScreen.routeName);
                          },
                          child: const Text('Log in'),
                        ),
                      ],
                    ],
                  ),
                  body: ScreenTypeLayout(
                    mobile: pages[_selectedIndex.value]!,
                    tablet: Row(
                      children: [
                        NavigationRail(
                          labelType: NavigationRailLabelType.all,
                          selectedIndex: _selectedIndex.value,
                          onDestinationSelected: (value) => ActionService.run(
                            () => _selectedIndex.value = value,
                            () => AnalyticsService.track(
                              message: Analytics.tabTapped,
                              params: {
                                'tab': pages[value].toString(),
                              },
                            ),
                          ),
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
                        VerticalDivider(
                          width: 3,
                          color: Colors.grey[200],
                          thickness: 7,
                        ),
                        Expanded(child: pages[_selectedIndex.value]!),
                      ],
                    ),
                    desktop: Row(
                      children: [
                        NavigationRail(
                          extended: true,
                          selectedIndex: _selectedIndex.value,
                          onDestinationSelected: (value) => ActionService.run(
                            () => _selectedIndex.value = value,
                            () => AnalyticsService.track(
                              message: Analytics.tabTapped,
                              params: {
                                'tab': pages[value].toString(),
                              },
                            ),
                          ),
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
                        VerticalDivider(
                          width: 3,
                          color: Colors.grey[200],
                          thickness: 7,
                        ),
                        Expanded(child: pages[_selectedIndex.value]!),
                      ],
                    ),
                  ),
                  // bottomNavigationBar: kIsWeb ||
                  //         getDeviceType(MediaQuery.of(context).size) ==
                  //             DeviceScreenType.desktop
                  //     ? null
                  //     : BottomNavigationBar(
                  //         onTap: (i) => setState(() => _selectedIndex = i),
                  //         currentIndex: _selectedIndex,
                  //         items: tabs
                  //             .map(
                  //               (tuple) => BottomNavigationBarItem(
                  //                 icon: Icon(tuple.value1),
                  //                 activeIcon: Icon(tuple.value2),
                  //                 label: tuple.value3,
                  //               ),
                  //             )
                  //             .toList(),
                  //       ),
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


// class MenuModel extends IMenuEntity {
//   final String name;
//   final double price;
//
//   const MenuModel({
//     required this.name,
//     required this.price,
//   });
// }

// class MenuModifier extends IMenuEntity {
//   const MenuModifier();
// }
//
// class ModifierGroupStipulations {
//   final bool isRequired;
//   final int maxSelectionsAllowed;
//   final int maxSameSelectionsAllowed;
//
//   const ModifierGroupStipulations({
//     required this.isRequired,
//     required this.maxSelectionsAllowed,
//     required this.maxSameSelectionsAllowed,
//   });
// }
//
// class ModifierGroup {
//   final String title;
//   final List<MenuModel> choices;
//   final ModifierGroupStipulations stipulations;
//
//   const ModifierGroup({
//     required this.title,
//     required this.choices,
//     required this.stipulations,
//   });
// }
//
// class MenuItem {
//   final String category;
//   final String name;
//   final double price;
//   final List<ModifierGroup> modificationGroups;
//
//   const MenuItem({
//     required this.category,
//     required this.name,
//     required this.price,
//     required this.modificationGroups,
//   });
// }
//
// class Menu {
//   final String name;
//   final List<MenuItem> items;
//
//   Menu({
//     required this.name,
//     required this.items,
//   });
// }
//
// final menu = Menu(
//   name: 'Main',
//   items: [
//     MenuItem(
//       category: 'Coffee',
//       name: 'OG Kraveman',
//       price: 8.50,
//       modificationGroups: [
//         ModifierGroup(
//           title: 'Choice of Size',
//           stipulations: ModifierGroupStipulations(
//             isRequired: true,
//             maxSelectionsAllowed: 1,
//             maxSameSelectionsAllowed: 1,
//           ),
//           choices: [
//             MenuModel(
//               name: 'Large (16 oz)',
//               price: 1.00,
//             ),
//             MenuModel(
//               name: 'Small (12 oz)',
//               price: 1.00,
//             ),
//           ],
//         ),
//         ModifierGroup(
//           title: 'Temperature',
//           stipulations: ModifierGroupStipulations(
//             isRequired: true,
//             maxSelectionsAllowed: 1,
//             maxSameSelectionsAllowed: 1,
//           ),
//           choices: [
//             MenuModel(
//               name: 'Hot',
//               price: 0.0,
//             ),
//             MenuModel(
//               name: 'Iced',
//               price: 0.0,
//             ),
//           ],
//         ),
//         ModifierGroup(
//           title: 'Add-Ons',
//           stipulations: ModifierGroupStipulations(
//             isRequired: true,
//             maxSelectionsAllowed: 1,
//             maxSameSelectionsAllowed: 1,
//           ),
//           choices: [
//             MenuModel(
//               name: 'Hot',
//               price: 0.0,
//             ),
//             MenuModel(
//               name: 'Iced',
//               price: 0.0,
//             ),
//           ],
//         ),
//       ],
//     ),
//     MenuItem(
//       category: 'Coffee',
//       name: 'Mocha Kraveman',
//       price: 8.50,
//       modificationGroups: [],
//     ),
//     MenuItem(
//       category: 'Waffles',
//       name: 'Liege Waffle',
//       price: 8.50,
//       modificationGroups: [],
//     ),
//   ],
// );
//
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: menu.items.map((item) {
//           return Column(children: [
//             Text(item.name),
//             Text(item.price.toString()),
//             ...item.modificationGroups.map((group) {
//               //
//               return Column(
//                 children: [
//                   Text(group.title),
//                   ...group.choices.map((choice) {
//                     return Text(choice.name);
//                   }).toList(),
//                 ],
//               );
//             }).toList(),
//           ]);
//         }).toList(),
//       ),
//     );
//   }
// }
