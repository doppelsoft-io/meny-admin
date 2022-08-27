import 'package:data_table_2/data_table_2.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
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
          ),
        ),
      ],
      child: BlocListener<StoreCubit, StoreState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (store) {
              context.read<ModifierGroupsCubit>().load(storeId: store.id!);
            },
            orElse: () {},
          );
        },
        child: const _MenusScreenModifierGroupsTab(),
      ),
    );
  }
}

class _MenusScreenModifierGroupsTab extends HookWidget {
  const _MenusScreenModifierGroupsTab({Key? key}) : super(key: key);

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

    void _sort(
      int columnIndex,
      bool descending,
      String name,
    ) {
      final storeCubit = context.read<StoreCubit>();
      final storeId = storeCubit.state.store.id;
      context.read<ModifierGroupsCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    void _onTapItem(BuildContext context, ModifierGroupModel group) {
      ActionService.run(
        () {
          GoRouter.of(context).goNamed(
            EditModifierGroupScreen.routeName,
            params: {'id': group.id!},
          );
        },
        () => AnalyticsService.track(
          message: Analytics.modifierGroupsTabModifierGroupSelected,
          params: {
            'groupId': group.id!,
            'groupName': group.name,
          },
        ),
      );
    }

    return modifierGroupsState.maybeWhen(
      orElse: () {
        final isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
        final groups = modifierGroupsState.groups;
        final orderBy = modifierGroupsState.orderBy;
        const action = NewModifierGroupButton();
        const header = PageTitle(title: 'Modifier Groups');
        const emptyMessage =
            'No modifier groups yet. Click "New" above to get started!';

        return Stack(
          children: [
            if (isMobile) ...[
              ResourceList<ModifierGroupModel>(
                header: header,
                action: action,
                resources: groups,
                emptyMessage: emptyMessage,
                onTapItem: _onTapItem,
                itemBuilder: (_, group) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: DSSpacing.sm,
                      vertical: DSSpacing.xxs,
                    ),
                    onTap: () => _onTapItem(context, group),
                    title: Text(group.name),
                    subtitle:
                        Text('Updated: ${group.updatedAt?.format() ?? ''}'),
                    isThreeLine: true,
                  );
                },
              ),
            ] else ...[
              ResourceTable<ModifierGroupModel>(
                sortAscending: !orderBy.descending,
                sortColumnIndex: orderBy.sortColumnIndex,
                header: header,
                action: action,
                resources: groups,
                emptyMessage: emptyMessage,
                onTapItem: _onTapItem,
                columns: [
                  DataColumn2(
                    label: DSText(
                      'NAME',
                      theme: DSTextThemeData.labelSmall(),
                    ),
                    size: ColumnSize.L,
                    onSort: (columnIndex, descending) =>
                        _sort(columnIndex, descending, 'name'),
                  ),
                  DataColumn2(
                    label: DSText(
                      'CREATED',
                      theme: DSTextThemeData.labelSmall(),
                    ),
                    fixedWidth: 200,
                    size: ColumnSize.S,
                    onSort: (columnIndex, descending) =>
                        _sort(columnIndex, descending, 'createdAt'),
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
                            theme: DSTextThemeData.labelLarge(),
                          ),
                          DSText(
                            'Last updated: ${group.updatedAt?.format()}',
                            theme: DSTextThemeData.bodySmall(),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      DSText(
                        group.createdAt?.format() ?? '',
                        theme: DSTextThemeData.bodyMedium(),
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
