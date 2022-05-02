import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/locator.dart';
import 'package:meny/src/constants/analytics.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/menus/menu_preview/menu_preview_screen.dart';
import 'package:meny/src/presentation/menus/menus/update_menus/update_menus_sheet.dart';
import 'package:meny/src/presentation/menus/widgets/widgets.dart';
import 'package:meny/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny/src/services/services.dart';

class MenusMenusTab extends StatefulWidget {
  const MenusMenusTab({Key? key}) : super(key: key);

  static page() {
    return BlocProvider<ResourcesCubit>(
      create: (context) => ResourcesCubit(
        iResourcesRepository: Locator.instance<MenuRepository>(),
      ),
      child: const MenusMenusTab(),
    );
  }

  @override
  State<MenusMenusTab> createState() => _MenusMenusTabState();
}

class _MenusMenusTabState extends State<MenusMenusTab> {
  @override
  void initState() {
    final storeCubit = context.read<StoreCubit>();
    final storeId = storeCubit.state.store.id!;
    context.read<ResourcesCubit>().load(storeId: storeId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0),
                            ),
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
