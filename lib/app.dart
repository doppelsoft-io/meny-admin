import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:meny/src/custom_router.dart';
import 'package:meny/src/enums/enums.dart';
import 'package:meny/src/presentation/customer/customers_page.dart';
import 'package:meny/src/presentation/locations/locations_page.dart';
import 'package:meny/src/presentation/menus/menus_page.dart';
import 'package:meny/src/presentation/messaging/messaging_page.dart';
import 'package:meny/src/presentation/orders/orders_page.dart';
import 'package:meny/src/presentation/store_hours/store_hours_page.dart';
import 'package:meny/themes.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_framework/responsive_framework.dart';

const pages = {
  0: MenusPage(),
  1: OrdersPage(),
  2: LocationsPage(),
  3: StoreHoursPage(),
  4: MessagingPage(),
  5: CustomersPage(),
};

typedef TabTypeDef = dartz.Tuple3<IconData, IconData, String>;

const tabs = <TabTypeDef>[
  TabTypeDef(
    Icons.restaurant_menu_outlined,
    Icons.restaurant_menu,
    'Menus',
  ),
  TabTypeDef(
    Icons.list_alt_outlined,
    Icons.list_alt,
    'Orders',
  ),
  TabTypeDef(
    Icons.location_on_outlined,
    Icons.location_on,
    'Locations',
  ),
  TabTypeDef(
    Icons.access_time_outlined,
    Icons.access_time,
    'Store Hours',
  ),
  TabTypeDef(
    Icons.messenger_outline_outlined,
    Icons.messenger_outline,
    'Messaging',
  ),
  TabTypeDef(
    Icons.person_outline_outlined,
    Icons.person_outline,
    'Customers',
  ),
];

class App extends StatelessWidget {
  final Environment environment;
  const App({
    Key? key,
    required this.environment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        theme: Themes.defaultTheme,
        builder: (context, widget) => ResponsiveWrapper.builder(
          widget,
          maxWidth: 1600,
          minWidth: 450,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1200, name: TABLET),
            ResponsiveBreakpoint.resize(1400, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(
            color: Colors.white,
          ),
        ),
        onGenerateRoute: CustomRouter.onGenerateRoute,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Meny'),
        centerTitle: false,
      ),
      body: ScreenTypeLayout(
        mobile: pages[_selectedIndex]!,
        tablet: Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (value) =>
                  setState(() => _selectedIndex = value),
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
            Expanded(child: pages[_selectedIndex]!),
          ],
        ),
        desktop: Row(
          children: [
            NavigationRail(
              extended: true,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (value) =>
                  setState(() => _selectedIndex = value),
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
            Expanded(child: pages[_selectedIndex]!),
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
  }
}


// class MenuEntity extends IMenuEntity {
//   final String name;
//   final double price;
//
//   const MenuEntity({
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
//   final List<MenuEntity> choices;
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
//             MenuEntity(
//               name: 'Large (16 oz)',
//               price: 1.00,
//             ),
//             MenuEntity(
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
//             MenuEntity(
//               name: 'Hot',
//               price: 0.0,
//             ),
//             MenuEntity(
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
//             MenuEntity(
//               name: 'Hot',
//               price: 0.0,
//             ),
//             MenuEntity(
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
