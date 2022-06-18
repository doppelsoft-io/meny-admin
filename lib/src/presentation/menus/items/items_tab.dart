import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/menu_items/menu_items.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusItemsTab extends StatelessWidget {
  const MenusItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuItemsCubit>(
          create: (context) => MenuItemsCubit(),
        ),
      ],
      child: _MenusItemsTab(),
    );
  }
}

class _MenusItemsTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final menuItemsState = context.watch<MenuItemsCubit>().state;

    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id!;
        context.read<MenuItemsCubit>().load(storeId: storeId);
        return null;
      },
      const [],
    );
    return BlocListener<StoreCubit, StoreState>(
      listenWhen: (prev, curr) => prev.store != curr.store,
      listener: (context, state) =>
          context.read<MenuItemsCubit>()..load(storeId: state.store.id!),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: MenusPagePersistentHeaderDelegate(
                title: 'Items',
                onNewPressed: () => ActionService.run(
                  () => UpdateMenuItemSheet.open(
                    context: context,
                    resource: MenuItemModel.empty(),
                  ),
                  () => AnalyticsService.track(
                    message: Analytics.itemsTabNewTapped,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(Spacing.pageSpacing),
          child: menuItemsState.maybeWhen(
            loaded: (items) {
              return DataTable(
                dataRowHeight: 64,
                showCheckboxColumn: false,
                showBottomBorder: true,
                columns: items.isEmpty
                    ? [const DataColumn(label: Text('Name'))]
                    : ['Photo', 'Name', 'Price', 'Last Updated']
                        .map((e) => DataColumn(label: Text(e)))
                        .toList(),
                rows: items.isEmpty
                    ? [
                        const DataRow(
                          cells: [
                            DataCell(
                              Text(
                                'Items you create will appear here! Click "New" to add one.',
                              ),
                            )
                          ],
                        )
                      ]
                    : items
                        .map(
                          (e) => DataRow(
                            onSelectChanged: (selected) {
                              ActionService.run(
                                () => UpdateMenuItemSheet.open(
                                  context: context,
                                  resource: e,
                                ),
                                () => AnalyticsService.track(
                                  message: Analytics
                                      .ingredientsTabIngredientSelected,
                                  params: {
                                    'itemId': e.id!,
                                    'itemName': e.name,
                                  },
                                ),
                              );
                            },
                            cells: [
                              DataCell(
                                Builder(
                                  builder: (context) {
                                    final fallback =
                                        DImageUploadCardThemeData.fallback();
                                    return DImageUploadCard(
                                      theme: fallback.copyWith(
                                        width: fallback.width / 5,
                                        height: fallback.height / 5,
                                      ),
                                      url: e.imageUrl ?? '',
                                    );
                                  },
                                ),
                              ),
                              DataCell(
                                Text(e.name),
                              ),
                              DataCell(
                                Text(
                                  (e.priceInfo.price / 100).toCurrency(),
                                ),
                              ),
                              DataCell(
                                Text(
                                  e.updatedAt
                                          ?.formatWith('MM/dd/yy @ h:mm a') ??
                                      '',
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              );
            },
            orElse: SizedBox.shrink,
          ),
          // child: ResourceTable<MenuItemModel>(
          //   columnNames: const ['Photo', 'Name', 'Price', 'Last Updated'],
          //   dataColumnBuilder: (_, column) => DataColumn(
          //     label: Text(column),
          //   ),
          //   emptyRowBuilder: (context) => const DataRow(
          //     cells: [
          //       DataCell(
          //         Text(
          //           'Items you create will appear here! Click "New" to add one.',
          //         ),
          //       ),
          //     ],
          //   ),
          //   dataRowBuilder: (_, resource) {
          //     return DataRow(
          //       onSelectChanged: (selected) {
          //         ActionService.run(
          //           () => UpdateMenuItemSheet.open(
          //             context: context,
          //             resource: resource,
          //           ),
          //           () => AnalyticsService.track(
          //             message: Analytics.itemsTabItemSelected,
          //             params: {
          //               'itemId': resource.id!,
          //               'itemName': resource.name,
          //             },
          //           ),
          //         );
          //       },
          //       cells: [
          //         DataCell(
          //           Builder(
          //             builder: (context) {
          //               final fallback = DImageUploadCardThemeData.fallback();
          //               return DImageUploadCard(
          //                 theme: fallback.copyWith(
          //                   width: fallback.width / 5,
          //                   height: fallback.height / 5,
          //                 ),
          //                 url: resource.imageUrl ?? '',
          //               );
          //             },
          //           ),
          //         ),
          //         DataCell(
          //           Text(resource.name),
          //         ),
          //         DataCell(
          //           Text(
          //             (resource.priceInfo.price / 100).toCurrency(),
          //           ),
          //         ),
          //         DataCell(
          //           Text(
          //             resource.updatedAt?.formatWith('MM/dd/yy @ h:mm a') ?? '',
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
