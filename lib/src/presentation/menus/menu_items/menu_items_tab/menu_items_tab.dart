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

class MenuItemsTab extends StatelessWidget {
  const MenuItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuItemsCubit>(
          create: (context) => MenuItemsCubit(
            authCubit: context.read<AuthCubit>(),
          ),
        ),
      ],
      child: _MenusScreenItemsTab(),
    );
  }
}

class _MenusScreenItemsTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final menuItemsState = context.watch<MenuItemsCubit>().state;

    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id;
        if (storeId != null) {
          context.read<MenuItemsCubit>().load(storeId: storeId);
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
      context.read<MenuItemsCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    void _onTapItem(BuildContext context, MenuItemModel item) {
      ActionService.run(
        () {
          GoRouter.of(context).pushNamed(
            EditMenuItemScreen.routeName,
            params: {
              'id': item.id!,
            },
          );
        },
        () => AnalyticsService.track(
          message: Analytics.itemsTabItemSelected,
          params: {
            'itemId': item.id!,
            'itemName': item.name,
          },
        ),
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<StoreCubit, StoreState>(
          listenWhen: (prev, curr) => prev.store != curr.store,
          listener: (context, state) {
            if (state.store.id != null) {
              context.read<MenuItemsCubit>().load(storeId: state.store.id!);
            }
          },
        ),
      ],
      child: menuItemsState.maybeWhen(
        orElse: () {
          final isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
          final items = menuItemsState.items;
          final orderBy = menuItemsState.orderBy;
          const action = NewMenuItemButton();
          const header = PageTitle(title: 'Items');
          const emptyMessage =
              'No items yet. Click "New" above to get started!';

          return Stack(
            children: [
              if (isMobile) ...[
                ResourceList<MenuItemModel>(
                  header: header,
                  action: action,
                  resources: items,
                  emptyMessage: emptyMessage,
                  onTapItem: _onTapItem,
                  itemBuilder: (_, item) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: DSSpacing.medium,
                        vertical: DSSpacing.smallest,
                      ),
                      onTap: () => _onTapItem(context, item),
                      leading: MenuItemImage(imageUrl: item.imageUrl ?? ''),
                      title: Text(item.name),
                      trailing: Text((item.priceInfo.price / 100).toCurrency()),
                      subtitle: Text('Updated: ${item.updatedAt?.format()}'),
                      isThreeLine: true,
                    );
                  },
                ),
              ] else ...[
                ResourceTable<MenuItemModel>(
                  header: header,
                  action: action,
                  resources: items,
                  sortColumnIndex: orderBy.sortColumnIndex,
                  sortAscending: !orderBy.descending,
                  onTapItem: _onTapItem,
                  emptyMessage: emptyMessage,
                  columns: [
                    DataColumn2(
                      label: DSText(
                        'PHOTO',
                        theme: DSTextThemeData.labelSmall(),
                      ),
                      fixedWidth: 75,
                    ),
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
                        'PRICE',
                        theme: DSTextThemeData.labelSmall(),
                      ),
                      fixedWidth: 125,
                      onSort: (columnIndex, descending) => _sort(
                        columnIndex,
                        descending,
                        'priceInfo.price',
                      ),
                      numeric: true,
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
                  cellsBuilder: (_, item) {
                    return [
                      DataCell(MenuItemImage(imageUrl: item.imageUrl ?? '')),
                      DataCell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DSText(
                              item.name,
                              theme: DSTextThemeData.labelLarge(),
                            ),
                            DSText(
                              'Updated: ${item.updatedAt?.format()}',
                              theme: DSTextThemeData.bodySmall(),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        DSText(
                          (item.priceInfo.price / 100).toCurrency(),
                          theme: DSTextThemeData.bodyMedium(),
                        ),
                      ),
                      DataCell(
                        DSText(
                          item.createdAt?.format() ?? '',
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
                visible: menuItemsState.maybeWhen(
                  loading: (_, __) => true,
                  orElse: () => false,
                ),
                child: const LinearProgressIndicator(),
              )
            ],
          );
        },
      ),
    );
  }
}
