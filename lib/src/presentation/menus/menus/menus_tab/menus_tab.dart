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

class MenusTab extends StatelessWidget {
  const MenusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenusCubit>(
          create: (context) => MenusCubit(
            authCubit: context.read<AuthCubit>(),
          ),
        ),
      ],
      child: _MenusScreenMenusTab(),
    );
  }
}

class _MenusScreenMenusTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final storeState = context.watch<StoreCubit>().state;
    final menusState = context.watch<MenusCubit>().state;

    useEffect(
      () {
        storeState.maybeWhen(
          loaded: (store) {
            context.read<MenusCubit>().load(storeId: store.id!);
          },
          orElse: () {},
        );
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
      context.read<MenusCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    void _onTapItem(BuildContext context, MenuModel menu) {
      ActionService.run(
        () {
          GoRouter.of(context).goNamed(
            EditMenuScreen.routeName,
            params: {
              'id': menu.id!,
            },
          );
        },
        () => AnalyticsService.track(
          message: Analytics.menusTabItemSelected,
        ),
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<StoreCubit, StoreState>(
          listenWhen: (prev, curr) => prev.store != curr.store,
          listener: (context, state) {
            state.maybeWhen(
              loaded: (store) {
                context.read<MenusCubit>().load(storeId: state.store.id!);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: menusState.maybeWhen(
        orElse: () {
          final isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
          final menus = menusState.menus;
          final orderBy = menusState.orderBy;
          const header = PageTitle(title: 'Menus');
          const action = NewMenuButton();
          const emptyMessage =
              'No menus yet. Click "New" above to get started!';
          return Stack(
            children: [
              if (isMobile) ...[
                ResourceList<MenuModel>(
                  header: header,
                  action: action,
                  resources: menus,
                  emptyMessage: emptyMessage,
                  onTapItem: _onTapItem,
                  itemBuilder: (_, menu) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: DSSpacing.medium,
                        vertical: DSSpacing.smallest,
                      ),
                      onTap: () => _onTapItem(context, menu),
                      title: Text(menu.name),
                      subtitle: Text('Updated: ${menu.updatedAt?.format()}'),
                      isThreeLine: true,
                      trailing: PreviewMenuButton(menu: menu),
                    );
                  },
                ),
              ] else ...[
                ResourceTable<MenuModel>(
                  sortColumnIndex: orderBy.sortColumnIndex,
                  sortAscending: !orderBy.descending,
                  header: header,
                  action: action,
                  resources: menus,
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
                    const DataColumn2(
                      label: Text(''),
                      fixedWidth: 100,
                      size: ColumnSize.S,
                    ),
                  ],
                  cellsBuilder: (_, menu) {
                    return <DataCell>[
                      DataCell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DSText(
                              menu.name,
                              theme: DSTextThemeData.labelLarge(),
                            ),
                            DSText(
                              'Last updated: ${menu.updatedAt?.format()}',
                              theme: DSTextThemeData.bodySmall(),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        DSText(
                          menu.createdAt?.format() ?? '',
                          theme: DSTextThemeData.bodyMedium(),
                        ),
                      ),
                      DataCell(PreviewMenuButton(menu: menu)),
                    ];
                  },
                  emptyMessage:
                      'No menus yet. Click "New" above to get started!',
                  onTapItem: (_, menu) {
                    _onTapItem(context, menu);
                  },
                ),
              ],
              Visibility(
                maintainAnimation: true,
                maintainInteractivity: true,
                maintainSemantics: true,
                maintainSize: true,
                maintainState: true,
                visible: menusState.maybeWhen(
                  loading: (_, __) => true,
                  orElse: () => false,
                ),
                child: const LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
