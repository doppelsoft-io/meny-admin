import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/menu_items/menu_items.dart';
import 'package:meny/src/presentation/menus/items/update_items/update_menu_item_sheet.dart';
import 'package:meny/src/presentation/menus/widgets/widgets.dart';
import 'package:meny/src/presentation/resources/cubit/resources_cubit.dart';

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

class MenusItemsTab extends StatelessWidget {
  const MenusItemsTab({Key? key}) : super(key: key);

  static page() {
    print("page $page");
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
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxScrolled) {
        return [
          SliverPersistentHeader(
            pinned: true,
            delegate: MenusPagePersistentHeaderDelegate(
              title: 'Items',
              onNewPressed: () => UpdateMenuItemSheet.open(
                context: context,
                resource: MenuItemEntity.empty(),
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
            onSort: (index, value) {
              //
              print("index $index");
              print("value $value");
            },
          ),
          emptyRowBuilder: (context) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    'Items you create will appear here! Click "New" to add one.',
                  ),
                ),
              ],
            );
          },
          dataRowBuilder: (_, resource) {
            return DataRow(
              onSelectChanged: (selected) => UpdateMenuItemSheet.open(
                context: context,
                resource: resource,
              ),
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
    );
  }
}
