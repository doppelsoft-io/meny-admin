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
          )..load(storeId: context.read<StoreCubit>().state.store.id ?? ''),
        ),
        BlocProvider<BulkDeleteMenuItemsCubit>(
          create: (context) => BulkDeleteMenuItemsCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
        BlocProvider(
          create: (_) => ResourceTableItemSelectorCubit<MenuItemModel>(),
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
    final bulkDeleteMenuItemsState =
        context.watch<BulkDeleteMenuItemsCubit>().state;

    void sort({
      required int columnIndex,
      required bool descending,
      required String name,
    }) {
      final storeCubit = context.read<StoreCubit>();
      final storeId = storeCubit.state.store.id;
      context.read<MenuItemsCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              field: name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    void onTapItem(BuildContext context, MenuItemModel item) {
      ActionObject(
        () {
          context.read<ResourceTableItemSelectorCubit<MenuItemModel>>().clear();
          Locator.instance<NavigatorHelper>().goNamed(
            EditMenuItemScreen.routeName,
            params: {
              'id': item.id!,
            },
          );
        },
        event: DSEvent(
          Analytics.itemsTabItemSelected,
          properties: {
            'itemId': item.id,
            'itemName': item.name,
          },
        ),
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<BulkDeleteMenuItemsCubit, BulkDeleteMenuItemsState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (exception) {
                DialogService.showErrorDialog(
                  context: context,
                  failure: CustomException(message: exception.toString()),
                );
              },
              success: () {
                final items = context
                    .read<ResourceTableItemSelectorCubit<MenuItemModel>>()
                    .state
                    .items;
                Locator.instance<ToastService>().init(
                  DSToast.notification(
                    text:
                        '${items.length == 1 ? '1 item' : '${items.length} items'} successfully deleted.',
                  ),
                );
                context
                    .read<ResourceTableItemSelectorCubit<MenuItemModel>>()
                    .clear();
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: menuItemsState.maybeWhen(
        orElse: () {
          final items = menuItemsState.items;
          final orderBy = menuItemsState.orderBy;
          const action = NewMenuItemButton();
          const emptyMessage =
              'No items yet. Click "New" above to get started!';

          final resourceItemSelectorState = context
              .watch<ResourceTableItemSelectorCubit<MenuItemModel>>()
              .state;

          return Stack(
            children: [
              ScreenTypeLayout.builder(
                mobile: (context) {
                  return ResourceList<MenuItemModel>(
                    title: 'Items',
                    action: action,
                    resources: items,
                    emptyMessage: emptyMessage,
                    itemBuilder: (_, item) {
                      return DSListTile(
                        args: DSListTileArgs(
                          leading: MenuItemImage(imageUrl: item.imageUrl ?? ''),
                          title: item.name,
                          subtitle: DSText(
                            'Updated: ${item.updatedAt?.format()}',
                            theme: const DSTextThemeData.b5(),
                          ),
                          trailing:
                              Text((item.priceInfo.price / 100).toCurrency()),
                          onTap: () => onTapItem(context, item),
                        ),
                      );
                    },
                  );
                },
                desktop: (context) {
                  return ResourceTable<MenuItemModel>(
                    title: 'Items',
                    toolbar: resourceItemSelectorState.items.isNotEmpty
                        ? const MenuItemsToolbar()
                        : null,
                    action: action,
                    resources: items,
                    sortColumnIndex: orderBy.sortColumnIndex,
                    sortAscending: !orderBy.descending,
                    onTapItem: onTapItem,
                    emptyMessage: emptyMessage,
                    onSelectAll: (selected) {
                      if (selected ?? false) {
                        for (final item in items) {
                          context
                              .read<
                                  ResourceTableItemSelectorCubit<
                                      MenuItemModel>>()
                              .add(item);
                        }
                      } else {
                        for (final item in resourceItemSelectorState.items) {
                          context
                              .read<
                                  ResourceTableItemSelectorCubit<
                                      MenuItemModel>>()
                              .remove(item);
                        }
                      }
                    },
                    isSelected: (resource) {
                      return resourceItemSelectorState.items.contains(resource);
                    },
                    onSelectChanged: (selected, resource) {
                      if (selected ?? false) {
                        context
                            .read<
                                ResourceTableItemSelectorCubit<MenuItemModel>>()
                            .add(resource);
                      } else {
                        context
                            .read<
                                ResourceTableItemSelectorCubit<MenuItemModel>>()
                            .remove(resource);
                      }
                    },
                    columns: [
                      const DataColumn2(
                        label: DSText(
                          'PHOTO',
                          theme: DSTextThemeData.c2(),
                        ),
                        fixedWidth: 75,
                      ),
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
                          'PRICE',
                          theme: DSTextThemeData.c2(),
                        ),
                        fixedWidth: 125,
                        onSort: (columnIndex, descending) => sort(
                          columnIndex: columnIndex,
                          descending: descending,
                          name: 'priceInfo.price',
                        ),
                        numeric: true,
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
                                theme: const DSTextThemeData.b4(),
                              ),
                              DSText(
                                'Updated: ${item.updatedAt?.format()}',
                                theme: const DSTextThemeData.c2(),
                              ),
                            ],
                          ),
                        ),
                        DataCell(
                          DSText(
                            (item.priceInfo.price / 100).toCurrency(),
                            theme: const DSTextThemeData.b5(),
                          ),
                        ),
                        DataCell(
                          DSText(
                            item.createdAt?.format() ?? '',
                            theme: const DSTextThemeData.b5(),
                          ),
                        ),
                      ];
                    },
                  );
                },
              ),
              Visibility(
                maintainAnimation: true,
                maintainInteractivity: true,
                maintainSemantics: true,
                maintainSize: true,
                maintainState: true,
                visible: menuItemsState.maybeWhen(
                  loading: (_, __) => true,
                  orElse: () => bulkDeleteMenuItemsState.maybeWhen(
                    deleting: () => true,
                    orElse: () => false,
                  ),
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

class MenuItemsToolbar extends StatelessWidget {
  const MenuItemsToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DSToolbar(
      items: [
        DSToolbarItem.icon(
          onPressed: () => bulkDeleteItems(context),
          icon: Icons.delete,
          tooltip: 'Delete',
        ),
      ],
    );
  }

  Future<void> bulkDeleteItems(BuildContext context) async {
    final resourceItemSelectorState =
        context.read<ResourceTableItemSelectorCubit<MenuItemModel>>().state;
    final result = await DSConfirmDialog.open<bool>(
      context,
      args: const DSConfirmDialogArgs(
        title: 'Are you sure?',
        content: Text(
          'This will remove all items from any menus they appear on. This action cannot be undone.',
        ),
        confirmArgs: DSConfirmDialogConfirmArgs(
          text: 'Yes, Delete',
        ),
      ),
    );
    if (result != null && result) {
      // ignore: use_build_context_synchronously
      await context.read<BulkDeleteMenuItemsCubit>().batchDelete(
            menuItemIds: resourceItemSelectorState.items
                .map((item) => item.id!)
                .toList(),
          );
    }
  }
}
