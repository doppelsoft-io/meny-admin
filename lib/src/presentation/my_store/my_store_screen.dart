import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/app/feature_flag_constants.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class MyStoreScreen extends StatelessWidget {
  const MyStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeatureFlagCubit(
        flag: FeatureFlags.storeManagement,
      ),
      child: const _MyStorePage(),
    );
  }
}

class _MyStorePage extends HookWidget {
  const _MyStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final featureFlagState = context.watch<FeatureFlagCubit>().state;
    return featureFlagState.maybeWhen(
      loaded: (enabled) {
        final tabs = [
          const Tab(text: 'Details'),
          if (enabled) ...[
            const Tab(text: 'Hours'),
            const Tab(text: 'Locations'),
          ],
        ];
        return DefaultTabController(
          animationDuration: Duration.zero,
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[50],
              centerTitle: false,
              automaticallyImplyLeading: false,
              flexibleSpace: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                // onTap: (index) => ActionService.run(
                //   () => null,
                //   () => AnalyticsService.track(
                //     message: Analytics.menusTabTabTapped,
                //     params: {
                //       'tab': _tabs[index].text ?? '',
                //     },
                //   ),
                // ),
                isScrollable: true,
                indicatorWeight: 4,
                tabs: tabs,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(DSSpacing.medium),
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const MyStoreDetailsTab(),
                  if (enabled) ...[
                    const MyStoreHoursTab(),
                    const MyStoreLocationsTab(),
                  ]
                ],
              ),
            ),
          ),
        );
      },
      orElse: SizedBox.shrink,
    );
  }
}
