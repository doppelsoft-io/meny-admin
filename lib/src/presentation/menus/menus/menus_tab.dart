import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/presentation/menus/menu_preview/menu_preview_screen.dart';
import 'package:meny/src/presentation/menus/menus/update_menus/update_menus_sheet.dart';
import 'package:meny/src/presentation/menus/widgets/widgets.dart';
import 'package:meny/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:core/core.dart';

class MenusMenusTab extends StatelessWidget {
  const MenusMenusTab({Key? key}) : super(key: key);

  static page() {
    return BlocProvider<ResourcesCubit>(
      create: (context) => ResourcesCubit<MenuEntity>.use(),
      child: const MenusMenusTab(),
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
              title: 'Menus',
              onNewPressed: () {
                return UpdateMenusSheet.open(
                  context: context,
                  menu: MenuEntity.empty(),
                );
              },
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(Spacing.pageSpacing),
        child: ResourceTable<MenuEntity>(
          columnNames: const ['Name', 'Last Updated', 'Actions'],
          dataColumnBuilder: (_, column) => DataColumn(label: Text(column)),
          emptyRowBuilder: (context) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    'Menus you create will appear here! Click "New" to add one.',
                  ),
                ),
              ],
            );
          },
          dataRowBuilder: (BuildContext _, resource) {
            return DataRow(
              onSelectChanged: (selected) {
                UpdateMenusSheet.open(
                  context: context,
                  menu: resource,
                );
              },
              cells: [
                DataCell(Text(resource.name)),
                DataCell(
                  Text(
                    resource.updatedAt?.formatWith('MM/dd/yy @ h:mm a') ?? '',
                  ),
                ),
                DataCell(
                  Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(0),
                          ),
                        ),
                        child: const Text('Preview'),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            MenuPreviewScreen.routeName,
                            arguments: MenuPreviewScreenArgs(menu: resource),
                          );
                        },
                      ),
                    ],
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
