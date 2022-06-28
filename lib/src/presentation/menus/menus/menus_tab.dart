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
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusMenusTab extends StatelessWidget {
  const MenusMenusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResourcesCubit>(
      create: (context) => ResourcesCubit<MenuModel>(
        iResourcesRepository: Locator.instance<MenuRepository>(),
      ),
      child: _MenusMenusTab(),
    );
  }
}

class _MenusMenusTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final menusState = context.watch<ResourcesCubit>().state;
    final menus = List<MenuModel>.from(menusState.resources);

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
      child: SingleChildScrollView(
        child: DTable(
          args: DTableArgs(
            header: DText.headline5('Menus'),
            actions: [
              PageActionButton(
                title: 'New',
                onPressed: () {
                  ActionService.run(
                    () => UpdateMenusSheet.open(
                      context: context,
                      menu: MenuModel.empty(),
                    ),
                    () => AnalyticsService.track(
                      message: Analytics.menusTabNewTapped,
                    ),
                  );
                },
              ),
            ],
            columns: [
              const DTableHeader(name: 'Name'),
              const DTableHeader(name: 'Last Updated'),
              const DTableHeader(name: 'Actions'),
            ],
            source: DTableDataSource(
              emptyBuilder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(height: kMinInteractiveDimension),
                    DText.bodyText1(
                      'No menus yet. Click "New" above to add a menu',
                    ),
                    const Divider(height: kMinInteractiveDimension),
                  ],
                );
              },
              rows: menus
                  .map(
                    (e) => DTableRow(
                      onSelectChanged: (selected) {
                        ActionService.run(
                          () => UpdateMenusSheet.open(
                            context: context,
                            menu: e,
                          ),
                          () => AnalyticsService.track(
                            message: Analytics.menusTabItemSelected,
                          ),
                        );
                      },
                      cells: [
                        DTableCell(
                          builder: () => DText.bodyText1(e.name),
                        ),
                        DTableCell(
                          builder: () {
                            return DText.bodyText1(
                              e.updatedAt?.formatWith('MM/dd/yy @ h:mm a') ??
                                  '',
                            );
                          },
                        ),
                        DTableCell(
                          builder: () {
                            return Row(
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    alignment: Alignment.center,
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.zero,
                                    ),
                                  ),
                                  child: const Text('Preview'),
                                  onPressed: () => ActionService.run(
                                    () => Navigator.of(context).pushNamed(
                                      MenuPreviewScreen.routeName,
                                      arguments: MenuPreviewScreenArgs(menu: e),
                                    ),
                                    () => AnalyticsService.track(
                                      message: Analytics.menusTabPreviewTapped,
                                      params: {
                                        'menuId': e.id!,
                                        'menuName': e.name,
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
