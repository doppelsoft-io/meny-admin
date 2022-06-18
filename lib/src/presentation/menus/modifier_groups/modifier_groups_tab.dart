import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/modifier_groups/modifier_groups.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class ModifierGroupsTab extends StatelessWidget {
  const ModifierGroupsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ModifierGroupsCubit>(
      create: (context) => ModifierGroupsCubit(),
      child: BlocListener<StoreCubit, StoreState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (store) =>
                context.read<ModifierGroupsCubit>().load(storeId: store.id!),
            orElse: () {},
          );
        },
        child: const _ModifierGroupsTab(),
      ),
    );
  }
}

class _ModifierGroupsTab extends HookWidget {
  const _ModifierGroupsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modifierGroupsState = context.watch<ModifierGroupsCubit>().state;

    useEffect(
      () {
        final storeState = context.read<StoreCubit>().state;
        final storeId = storeState.whenOrNull(loaded: (_) => _.id);
        if (storeId != null) {
          context.read<ModifierGroupsCubit>().load(storeId: storeId);
        }
        return null;
      },
      const [],
    );
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(
            pinned: true,
            delegate: MenusPagePersistentHeaderDelegate(
              title: 'Modifier Groups',
              onNewPressed: () {
                ActionService.run(
                  () => UpdateModifierGroupSheet.open(
                    context: context,
                    resource: ModifierGroupModel.empty(),
                  ),
                  () => AnalyticsService.track(
                    message: Analytics.modifierGroupsTabNewTapped,
                  ),
                );
              },
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(Spacing.pageSpacing),
        child: modifierGroupsState.maybeWhen(
          loading: (_) => Column(
            children: const [
              LinearProgressIndicator(),
            ],
          ),
          loaded: (ingredients) {
            return DataTable(
              showCheckboxColumn: false,
              showBottomBorder: true,
              columns: ingredients.isEmpty
                  ? [const DataColumn(label: Text('Name'))]
                  : const [
                      DataColumn(label: Text('Name')),
                      // DataColumn(
                      //   label: Text(
                      //     'Price',
                      //   ),
                      // ),
                      // DataColumn(
                      //   label: Text(
                      //     'Last Updated',
                      //   ),
                      // ),
                    ],
              rows: ingredients.isEmpty
                  ? [
                      const DataRow(
                        cells: [
                          DataCell(
                            Text(
                              'Modifier groups you create will appear here! Click "New" to add one.',
                            ),
                          )
                        ],
                      )
                    ]
                  : ingredients
                      .map(
                        (e) => DataRow(
                          onSelectChanged: (selected) {
                            ActionService.run(
                              () => UpdateModifierGroupSheet.open(
                                context: context,
                                resource: e,
                              ),
                              () => AnalyticsService.track(
                                message: Analytics
                                    .modifierGroupsTabModifierGroupSelected,
                                params: {
                                  'groupId': e.id!,
                                  'groupName': e.name,
                                },
                              ),
                            );
                          },
                          cells: [
                            DataCell(Text(e.name)),
                            // DataCell(
                            //   Text(
                            //     (e.priceInfo.price / 100).toCurrency(),
                            //   ),
                            // ),
                            // DataCell(
                            //   Text(
                            //     e.updatedAt?.formatWith('MM/dd/yy @ h:mm a') ??
                            //         '',
                            //   ),
                            // ),
                          ],
                        ),
                      )
                      .toList(),
            );
          },
          orElse: SizedBox.shrink,
        ),
      ),
    );
  }
}
