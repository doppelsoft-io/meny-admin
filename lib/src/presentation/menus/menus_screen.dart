import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/app/feature_flag_constants.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';

class MenusScreen extends StatelessWidget {
  const MenusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeatureFlagCubit(
        flag: FeatureFlags.modifierGroupManagement,
      ),
      child: const _MenusScreen(),
    );
  }
}

class _MenusScreen extends HookWidget {
  const _MenusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final featureFlagState = context.watch<FeatureFlagCubit>().state;
    return featureFlagState.maybeWhen(
      loaded: (enabled) {
        final _tabs = [
          const Tab(text: 'Menus'),
          const Tab(text: 'Categories'),
          const Tab(text: 'Items'),
          if (enabled) const Tab(text: 'Modifier Groups'),
        ];

        return DefaultTabController(
          animationDuration: Duration.zero,
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[50],
              centerTitle: false,
              automaticallyImplyLeading: false,
              flexibleSpace: TabBar(
                enableFeedback: true,
                onTap: (index) => ActionService.run(
                  () => null,
                  () => AnalyticsService.track(
                    message: Analytics.menusTabTabTapped,
                    params: {
                      'tab': _tabs[index].text ?? '',
                    },
                  ),
                ),
                isScrollable: true,
                indicatorWeight: 4,
                tabs: _tabs,
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const MenusTab(),
                const CategoriesTab(),
                const MenuItemsTab(),
                if (enabled) const ModifierGroupsTab(),
              ],
            ),
          ),
        );
      },
      loading: (_) {
        return const CircularProgressIndicator();
      },
      orElse: SizedBox.shrink,
    );
  }
}
