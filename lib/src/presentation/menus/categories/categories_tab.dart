import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/presentation/menus/categories/update_categories/update_categories_sheet.dart';
import 'package:meny/src/presentation/menus/widgets/widgets.dart';
import 'package:meny/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny/src/constants/spacing.dart';

class MenusCategoriesTab extends StatelessWidget {
  const MenusCategoriesTab({Key? key}) : super(key: key);

  static page() {
    return BlocProvider<ResourcesCubit>(
      create: (context) => ResourcesCubit<CategoryEntity>.use(),
      child: const MenusCategoriesTab(),
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
              title: 'Categories',
              onNewPressed: () => UpdateCategorySheet.open(
                context: context,
                resource: CategoryEntity.empty(),
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(Spacing.pageSpacing),
        child: ResourceTable<CategoryEntity>(
          columnNames: const ['Name', 'Last Updated'],
          dataColumnBuilder: (_, column) => DataColumn(label: Text(column)),
          emptyRowBuilder: (context) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    'Categories you create will appear here! Click "New" to add one.',
                  ),
                ),
              ],
            );
          },
          dataRowBuilder: (_, resource) {
            return DataRow(
              onSelectChanged: (selected) => UpdateCategorySheet.open(
                context: context,
                resource: resource,
              ),
              cells: [
                DataCell(Text(resource.name)),
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
