import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/app/feature_flag_constants.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class MyStoreScreen extends StatelessWidget {
  const MyStoreScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  final TabScreenArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeatureFlagCubit(
        flag: FeatureFlags.storeManagement,
      ),
      child: _MyStorePage(args: args),
    );
  }
}

class _MyStorePage extends HookWidget {
  const _MyStorePage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final TabScreenArgs args;

  @override
  Widget build(BuildContext context) {
    final tabs = args.tabs;
    final child = args.child;
    final tabController = useTabController(
      initialLength: args.tabs.length,
      initialIndex: args.initialTabIndex,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        centerTitle: false,
        automaticallyImplyLeading: false,
        flexibleSpace: TabBar(
          controller: tabController,
          enableFeedback: true,
          physics: const NeverScrollableScrollPhysics(),
          isScrollable: true,
          indicatorWeight: 4,
          tabs: tabs.map((tab) => DSTab(text: tab.label)).toList(),
          onTap: (index) {
            final tab = tabs[index];
            tabController.index = index;
            context.goNamed(tab.routePath);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(DSSpacing.sm),
        child: child,
      ),
    );
  }
}
