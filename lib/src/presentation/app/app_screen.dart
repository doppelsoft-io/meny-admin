// import 'package:doppelsoft_core/doppelsoft_core.dart';
// import 'package:doppelsoft_ui/doppelsoft_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:meny_admin/src/application/application.dart';
// import 'package:meny_admin/src/constants/analytics.dart';
// import 'package:meny_admin/src/domain/core/action_object.dart';
// import 'package:meny_admin/src/presentation/presentation.dart';
// import 'package:meny_admin/src/services/services.dart';
// import 'package:meny_admin/tabs.dart';

// class AppScreen extends StatelessWidget {
//   const AppScreen({Key? key}) : super(key: key);

//   static const String routeName = '/';

//   @override
//   Widget build(BuildContext context) {
//     return _AppScreen();
//   }
// }

// class _AppScreen extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final selectedIndex = useState<int>(0);

//     return BlocBuilder<AuthCubit, AuthState>(
//       builder: (context, authState) {
//         return authState.maybeWhen(
//           authenticated: (_) {
//             return _ScreenContent(selectedIndex: selectedIndex);
//           },
//           orElse: () {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class _ScreenContent extends StatelessWidget {
//   const _ScreenContent({
//     Key? key,
//     required this.selectedIndex,
//   }) : super(key: key);
//   final ValueNotifier<int> selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<StoreCubit, StoreState>(
//       listenWhen: (prev, curr) => prev.store != curr.store,
//       listener: (context, storeState) {
//         storeState.maybeWhen(
//           error: (store, exception) {
//             DialogService.showErrorDialog(
//               context: context,
//               failure: CustomException(message: exception.toString()),
//             );
//           },
//           orElse: () {},
//         );
//       },
//       builder: (context, storeState) {
//         return storeState.maybeWhen(
//           loading: (_) => const Scaffold(
//             body: LoadingDisplay(
//               alignment: Alignment.center,
//             ),
//           ),
//           error: (_, exception) => Scaffold(
//             body: ErrorDisplay(
//               exception: CustomException(message: exception.toString()),
//             ),
//           ),
//           loaded: (store) {
//             final pages = tabs.map((e) => e.value4).toList();
//             return ScreenTypeLayout.builder(
//               mobile: (_) => Scaffold(
//                 appBar: PreferredSize(
//                   preferredSize: Size.fromHeight(
//                     getValueForScreenType<double>(
//                       context: context,
//                       mobile: kToolbarHeight,
//                       desktop: 76,
//                     ),
//                   ),
//                   child: const AppHeader(),
//                 ),
//                 body: pages[selectedIndex.value],
//                 bottomNavigationBar: BottomNavigationBar(
//                   currentIndex: selectedIndex.value,
//                   type: BottomNavigationBarType.fixed,
//                   onTap: (index) {
//                     selectedIndex.value = index;
//                   },
//                   items: tabs
//                       .map(
//                         (tuple) => BottomNavigationBarItem(
//                           icon: Icon(tuple.value1),
//                           activeIcon: Icon(tuple.value2),
//                           label: tuple.value3,
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//               tablet: (_) => _DesktopLayout(
//                 onSelect: (index) => ActionObject(
//                   () => selectedIndex.value = index,
//                   event: DSEvent(
//                     Analytics.tabTapped,
//                     properties: {
//                       'tab': pages[index].toString(),
//                     },
//                   ),
//                 ),
//                 selectedIndex: selectedIndex.value,
//                 child: pages[selectedIndex.value],
//               ),
//               desktop: (_) => _DesktopLayout(
//                 onSelect: (index) => ActionObject(
//                   () => selectedIndex.value = index,
//                   event: DSEvent(
//                     Analytics.tabTapped,
//                     properties: {
//                       'tab': pages[index].toString(),
//                     },
//                   ),
//                 ),
//                 selectedIndex: selectedIndex.value,
//                 child: pages[selectedIndex.value],
//               ),
//             );
//           },
//           orElse: () => const SizedBox.shrink(),
//         );
//       },
//     );
//   }
// }

// class _DesktopLayout extends StatelessWidget {
//   const _DesktopLayout({
//     Key? key,
//     required this.selectedIndex,
//     required this.onSelect,
//     required this.child,
//   }) : super(key: key);

//   final int selectedIndex;
//   final Function(int) onSelect;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(
//           getValueForScreenType<double>(
//             context: context,
//             mobile: kToolbarHeight,
//             desktop: 76,
//           ),
//         ),
//         child: const AppHeader(),
//       ),
//       body: Row(
//         children: [
//           NavigationRail(
//             extended: getValueForScreenType<bool>(
//               context: context,
//               mobile: false,
//               tablet: false,
//               desktop: true,
//             ),
//             selectedIndex: selectedIndex,
//             onDestinationSelected: onSelect,
//             destinations: tabs
//                 .map(
//                   (tuple) => NavigationRailDestination(
//                     icon: Icon(tuple.value1),
//                     selectedIcon: Icon(tuple.value2),
//                     label: DSText(
//                       tuple.value3,
//                       theme: const DSTextThemeData.b4(),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           VerticalDivider(
//             width: 3,
//             color: Colors.grey[200],
//             thickness: 7,
//           ),
//           Expanded(child: child),
//         ],
//       ),
//     );
//   }
// }
