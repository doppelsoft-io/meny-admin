import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/menus/menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/presentation/menus/menus/widgets/new_menu_button.dart';
import 'package:meny_admin/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusScreenMenusTab extends StatelessWidget {
  const MenusScreenMenusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ResourcesCubit>(
          create: (context) => ResourcesCubit<MenuModel>(
            iResourcesRepository: Locator.instance<MenuRepository>(),
          ),
        ),
        BlocProvider<CreateMenuCubit>(
          create: (context) => CreateMenuCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
      ],
      child: _MenusScreenMenusTab(),
    );
  }
}

class _MenusScreenMenusTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final menusState = context.watch<ResourcesCubit>().state;
    final createMenuState = context.watch<CreateMenuCubit>().state;
    final menus = List<MenuModel>.from(menusState.resources);

    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id;
        if (storeId != null) {
          context.read<ResourcesCubit>().load(storeId: storeId);
        }
        return null;
      },
      const [],
    );
    return BlocListener<StoreCubit, StoreState>(
      listenWhen: (prev, curr) => prev.store != curr.store,
      listener: (context, state) {
        if (state.store.id != null) {
          context.read<ResourcesCubit>().load(storeId: state.store.id!);
        }
      },
      child: SingleChildScrollView(
        child: createMenuState.maybeWhen(
          creating: (_) {
            return const CircularProgressIndicator();
          },
          orElse: () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DTable(
                  args: DTableArgs(
                    header: DText.headline5('Menus'),
                    actions: [
                      const NewMenuButton(),
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
                                  () {},
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
                                      e.updatedAt?.formatWith(
                                            'MM/dd/yy @ h:mm a',
                                          ) ??
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
                                            () =>
                                                Navigator.of(context).pushNamed(
                                              MenuPreviewScreen.routeName,
                                              arguments: MenuPreviewScreenArgs(
                                                menu: e,
                                              ),
                                            ),
                                            () => AnalyticsService.track(
                                              message: Analytics
                                                  .menusTabPreviewTapped,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
