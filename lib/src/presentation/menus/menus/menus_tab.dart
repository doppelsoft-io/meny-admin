import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/menus/menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusMenusTab extends StatelessWidget {
  const MenusMenusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResourcesCubit>(
      create: (context) => ResourcesCubit(
        iResourcesRepository: Locator.instance<MenuRepository>(),
      ),
      child: _MenusMenusTab(),
    );
  }
}

class _MenusMenusTab extends HookWidget {
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
          context.read<ResourcesCubit>().load(storeId: state.store.id!),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: MenusPagePersistentHeaderDelegate(
                title: 'Menus',
                onNewPressed: () => ActionService.run(
                  () => UpdateMenusSheet.open(
                    context: context,
                    menu: MenuModel.empty(),
                  ),
                  () => AnalyticsService.track(
                    message: Analytics.menusTabNewTapped,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(Spacing.pageSpacing),
          child: ResourceTable<MenuModel>(
            columnNames: const ['Name', 'Last Updated', 'Actions'],
            dataColumnBuilder: (_, column) => DataColumn(label: Text(column)),
            emptyRowBuilder: (context) {
              return const DataRow(
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
                  ActionService.run(
                    () => UpdateMenusSheet.open(
                      context: context,
                      menu: resource,
                    ),
                    () => AnalyticsService.track(
                      message: Analytics.menusTabItemSelected,
                    ),
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
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          child: const Text('Preview'),
                          onPressed: () => ActionService.run(
                            () => Navigator.of(context).pushNamed(
                              MenuPreviewScreen.routeName,
                              arguments: MenuPreviewScreenArgs(menu: resource),
                            ),
                            () => AnalyticsService.track(
                              message: Analytics.menusTabPreviewTapped,
                              params: {
                                'menuId': resource.id!,
                                'menuName': resource.name,
                              },
                            ),
                          ),
                        ),
                      ],
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
