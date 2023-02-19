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

    void sort({
      required int columnIndex,
      required bool descending,
      required String name,
    }) {
      final storeCubit = context.read<StoreCubit>();
      final storeId = storeCubit.state.store.id;
      context.read<MenusCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              field: name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    void onTapItem(BuildContext context, MenuModel menu) {
      ActionObject(
        () {
          Locator.instance<NavigatorHelper>().goNamed(
            EditMenuScreen.routeName,
            params: {
              'id': menu.id!,
            },
          );
        },
        event: const DSEvent(Analytics.menusTabItemSelected),
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
          const action = NewMenuButton();
          const emptyMessage =
              'No menus yet. Click "New" above to get started!';
          return Stack(
            children: [
              if (isMobile) ...[
                ResourceList<MenuModel>(
                  title: 'Menus',
                  action: action,
                  resources: menus,
                  emptyMessage: emptyMessage,
                  itemBuilder: (_, menu) {
                    return DSListTile(
                      args: DSListTileArgs(
                        onTap: () => onTapItem(context, menu),
                        title: menu.name,
                        subtitle: Text('Updated: ${menu.updatedAt?.format()}'),
                        trailing: PreviewMenuButton(menu: menu),
                      ),
                    );
                  },
                ),
              ] else ...[
                ResourceTable<MenuModel>(
                  sortColumnIndex: orderBy.sortColumnIndex,
                  sortAscending: !orderBy.descending,
                  title: 'Menus',
                  action: action,
                  resources: menus,
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
                              theme: const DSTextThemeData.b4(),
                            ),
                            DSText(
                              'Last updated: ${menu.updatedAt?.format()}',
                              theme: const DSTextThemeData.c2(),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        DSText(
                          menu.createdAt?.format() ?? '',
                          theme: const DSTextThemeData.b5(),
                        ),
                      ),
                      DataCell(PreviewMenuButton(menu: menu)),
                    ];
                  },
                  emptyMessage:
                      'No menus yet. Click "New" above to get started!',
                  onTapItem: (_, menu) {
                    onTapItem(context, menu);
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
