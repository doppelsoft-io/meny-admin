import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/app/feature_flag_constants.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/core/action_object.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

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

class _MenusScreen extends StatelessWidget {
  const _MenusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final featureFlagState = context.watch<FeatureFlagCubit>().state;
    return featureFlagState.maybeWhen(
      loaded: (enabled) {
        final tabs = [
          const DSTab(text: 'Menus'),
          const DSTab(text: 'Categories'),
          const DSTab(text: 'Items'),
          if (enabled) const DSTab(text: 'Modifier Groups'),
        ];

        return DefaultTabController(
          animationDuration: const Duration(milliseconds: 100),
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: whiteColor,
              centerTitle: false,
              automaticallyImplyLeading: false,
              flexibleSpace: Material(
                color: grey50Color,
                child: TabBar(
                  enableFeedback: true,
                  onTap: (index) async {
                    ActionObject(
                      () {},
                      event: DSEvent(
                        Analytics.menusTabTabTapped,
                        properties: {
                          'tab': tabs[index].text ?? '',
                        },
                      ),
                    );
                  },
                  isScrollable: true,
                  indicatorWeight: 4,
                  tabs: tabs,
                ),
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
