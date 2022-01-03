import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/constants/analytics.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/categories/categories.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/menus/categories/update_categories/update_categories_sheet.dart';
import 'package:meny/src/presentation/menus/widgets/widgets.dart';
import 'package:meny/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny/src/services/services.dart';

class MenusCategoriesTab extends StatefulWidget {
  const MenusCategoriesTab({Key? key}) : super(key: key);

  static page() {
    return BlocProvider<ResourcesCubit>(
      create: (context) => ResourcesCubit<CategoryEntity>.use(),
      child: const MenusCategoriesTab(),
    );
  }

  @override
  State<MenusCategoriesTab> createState() => _MenusCategoriesTabState();
}

class _MenusCategoriesTabState extends State<MenusCategoriesTab> {
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
                title: 'Categories',
                onNewPressed: () => ActionService.run(
                  () => UpdateCategorySheet.open(
                    context: context,
                    resource: CategoryEntity.empty(),
                  ),
                  () => AnalyticsService.track(
                    message: Analytics.categoriesTabNewTapped,
                  ),
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
                onSelectChanged: (selected) => ActionService.run(
                  () => UpdateCategorySheet.open(
                    context: context,
                    resource: resource,
                  ),
                  () => AnalyticsService.track(
                    message: Analytics.categoriesTabItemSelected,
                    params: {
                      'categoryId': resource.id!,
                      'categoryName': resource.name,
                    },
                  ),
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
      ),
    );
  }
}
