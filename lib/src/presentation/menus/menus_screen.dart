import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/app/feature_flag_constants.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/core/action_object.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class MenusScreen extends StatelessWidget {
  const MenusScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  final TabScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeatureFlagCubit(
        flag: FeatureFlags.modifierGroupManagement,
      ),
      child: _MenusScreen(args: args),
    );
  }
}

class _MenusScreen extends HookWidget {
  const _MenusScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  final TabScreenArgs args;

  @override
  Widget build(BuildContext context) {
    final tabs = args.tabs;
    final initialTabIndex = args.initialTabIndex;
    final child = args.child;

    final tabController = useTabController(
      initialLength: tabs.length,
      initialIndex: initialTabIndex,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: false,
        automaticallyImplyLeading: false,
        flexibleSpace: Material(
          color: grey50Color,
          child: TabBar(
            controller: tabController,
            enableFeedback: true,
            onTap: (index) {
              ActionObject(
                () {
                  final tab = tabs[index];
                  context.goNamed(tab.routePath);
                },
                event: DSEvent(
                  Analytics.menusTabTabTapped,
                  properties: {'tab': tabs[index].label},
                ),
              );
            },
            isScrollable: true,
            indicatorWeight: 4,
            tabs: tabs.map((tab) => DSTab(text: tab.label)).toList(),
          ),
        ),
      ),
      body: child,
    );
  }
}
