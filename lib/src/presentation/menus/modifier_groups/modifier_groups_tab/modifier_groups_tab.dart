import 'package:data_table_2/data_table_2.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_core/meny_core.dart';

class ModifierGroupsTab extends StatelessWidget {
  const ModifierGroupsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ModifierGroupsCubit>(
          create: (context) => ModifierGroupsCubit(
            authCubit: context.read<AuthCubit>(),
          )..load(storeId: context.read<StoreCubit>().state.store.id ?? ''),
        ),
      ],
      child: const _MenusScreenModifierGroupsTab(),
    );
  }
}

class _MenusScreenModifierGroupsTab extends HookWidget {
  const _MenusScreenModifierGroupsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modifierGroupsState = context.watch<ModifierGroupsCubit>().state;

    void sort({
      required int columnIndex,
      required bool descending,
      required String name,
    }) {
      final storeCubit = context.read<StoreCubit>();
      final storeId = storeCubit.state.store.id;
      context.read<ModifierGroupsCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              field: name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    void onTapItem(BuildContext context, ModifierGroupModel group) {
      ActionObject(
        () {
          Locator.instance<NavigatorHelper>().goNamed(
            EditModifierGroupScreen.routeName,
            params: {'id': group.id!},
          );
        },
        event: DSEvent(
          Analytics.modifierGroupsTabModifierGroupSelected,
          properties: {
            'groupId': group.id,
            'groupName': group.name,
          },
        ),
      );
    }

    return modifierGroupsState.maybeWhen(
      orElse: () {
        final isMobile = ResponsiveBreakpoints.of(context).isMobile;
        final groups = modifierGroupsState.groups;
        final orderBy = modifierGroupsState.orderBy;
        const action = NewModifierGroupButton();
        const emptyMessage =
            'No modifier groups yet. Click "New" above to get started!';

        return Stack(
          children: [
            if (isMobile) ...[
              ResourceList<ModifierGroupModel>(
                title: 'Modifier Groups',
                action: action,
                resources: groups,
                emptyMessage: emptyMessage,
                itemBuilder: (_, group) {
                  return DSListTile(
                    args: DSListTileArgs(
                      onTap: () => onTapItem(context, group),
                      title: group.name,
                      subtitle:
                          Text('Updated: ${group.updatedAt?.format() ?? ''}'),
                    ),
                  );
                },
              ),
            ] else ...[
              ResourceTable<ModifierGroupModel>(
                title: 'Modifier Groups',
                sortAscending: !orderBy.descending,
                sortColumnIndex: orderBy.sortColumnIndex,
                action: action,
                resources: groups,
                emptyMessage: emptyMessage,
                onTapItem: onTapItem,
                columns: [
                  DataColumn2(
                    label: const DSText(
                      'NAME',
                      theme: DSTextThemeData.c2(),
                    ),
                    size: ColumnSize.L,
                    onSort: (columnIndex, descending) => sort(
                      columnIndex: columnIndex,
                      descending: descending,
                      name: 'name',
                    ),
                  ),
                  DataColumn2(
                    label: const DSText(
                      'CREATED',
                      theme: DSTextThemeData.c2(),
                    ),
                    fixedWidth: 200,
                    size: ColumnSize.S,
                    onSort: (columnIndex, descending) => sort(
                      columnIndex: columnIndex,
                      descending: descending,
                      name: 'createdAt',
                    ),
                  ),
                ],
                cellsBuilder: (_, group) {
                  return [
                    DataCell(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DSText(
                            group.name,
                            theme: const DSTextThemeData.b4(),
                          ),
                          DSText(
                            'Last updated: ${group.updatedAt?.format()}',
                            theme: const DSTextThemeData.c2(),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      DSText(
                        group.createdAt?.format() ?? '',
                        theme: const DSTextThemeData.b5(),
                      ),
                    ),
                  ];
                },
              ),
            ],
            Visibility(
              maintainAnimation: true,
              maintainInteractivity: true,
              maintainSemantics: true,
              maintainSize: true,
              maintainState: true,
              visible: modifierGroupsState.maybeWhen(
                loading: (_, __) => true,
                orElse: () => false,
              ),
              child: const LinearProgressIndicator(),
            ),
          ],
        );
      },
    );
  }
}
