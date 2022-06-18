import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusCategoriesTab extends StatelessWidget {
  const MenusCategoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResourcesCubit>(
      create: (context) => ResourcesCubit<CategoryModel>.use(),
      child: _MenusCategoriesTab(),
    );
  }
}

class _MenusCategoriesTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id!;
        context.read<ResourcesCubit>().load(storeId: storeId);
        return null;
      },
      const [],
    );
    return BlocListener<StoreCubit, StoreState>(
      listenWhen: (prev, curr) => prev.store != curr.store,
      listener: (context, state) =>
          context.read<ResourcesCubit>()..load(storeId: state.store.id!),
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
                    resource: CategoryModel.empty(),
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
          child: ResourceTable<CategoryModel>(
            columnNames: const ['Name', 'Last Updated'],
            dataColumnBuilder: (_, column) => DataColumn(label: Text(column)),
            emptyRowBuilder: (context) {
              return const DataRow(
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
