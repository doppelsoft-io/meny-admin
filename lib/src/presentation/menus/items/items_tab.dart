import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/constants/analytics.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/menus/items/update_items/update_menu_item_sheet.dart';
import 'package:meny/src/presentation/menus/widgets/widgets.dart';
import 'package:meny/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny/src/services/services.dart';

class CustomTableCell extends StatelessWidget {
  final Widget child;
  const CustomTableCell({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}

class MenusItemsTab extends StatefulWidget {
  const MenusItemsTab({Key? key}) : super(key: key);

  static page() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ResourcesCubit>(
          create: (context) => ResourcesCubit<MenuItemEntity>.use(),
        ),
      ],
      child: const MenusItemsTab(),
    );
  }

  @override
  State<MenusItemsTab> createState() => _MenusItemsTabState();
}

class _MenusItemsTabState extends State<MenusItemsTab> {
  @override
  void initState() {
    final storeCubit = context.read<StoreCubit>();
    final storeId = storeCubit.state.store!.id!;
    context.read<ResourcesCubit>().load(storeId: storeId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreCubit, StoreState>(
      listenWhen: (prev, curr) => prev.store != curr.store,
      listener: (context, state) =>
          context.read<ResourcesCubit>()..load(storeId: state.store!.id!),
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
                    resource: MenuItemEntity.empty(),
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
          child: ResourceTable<MenuItemEntity>(
            columnNames: const ['Name', 'Price', 'Last Updated'],
            dataColumnBuilder: (_, column) => DataColumn(
              label: Text(column),
            ),
            emptyRowBuilder: (context) => DataRow(
              cells: [
                DataCell(
                  Text(
                    'Items you create will appear here! Click "New" to add one.',
                  ),
                ),
              ],
            ),
            dataRowBuilder: (_, resource) {
              return DataRow(
                onSelectChanged: (selected) {
                  ActionService.run(
                    () => UpdateMenuItemSheet.open(
                      context: context,
                      resource: resource,
                    ),
                    () => AnalyticsService.track(
                      message: Analytics.itemsTabItemSelected,
                      params: {
                        'itemId': resource.id!,
                        'itemName': resource.name,
                      },
                    ),
                  );
                },
                cells: [
                  DataCell(Text(resource.name)),
                  DataCell(Text(resource.price.toCurrency())),
                  DataCell(
                    Text(
                      resource.updatedAt?.formatWith('MM/dd/yy @ h:mm a') ?? '',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
