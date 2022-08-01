import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusTab extends StatelessWidget {
  const MenusTab({Key? key}) : super(key: key);

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
    return MultiBlocListener(
      listeners: [
        BlocListener<StoreCubit, StoreState>(
          listenWhen: (prev, curr) => prev.store != curr.store,
          listener: (context, state) {
            if (state.store.id != null) {
              context.read<ResourcesCubit>().load(storeId: state.store.id!);
            }
          },
        ),
        BlocListener<CreateMenuCubit, CreateMenuState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              creating: (_) {
                showDialog<void>(
                  context: context,
                  useRootNavigator: false,
                  barrierDismissible: false,
                  barrierColor: Colors.black12,
                  builder: (_) => WillPopScope(
                    onWillPop: () async => false,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
              created: (menu) {
                Navigator.of(context).pop();
                GoRouter.of(context).pushNamed(
                  EditMenuScreen.routeName,
                  params: {
                    'id': menu.id!,
                  },
                );
              },
            );
          },
        ),
      ],
      child: SingleChildScrollView(
        child: createMenuState.maybeWhen(
          creating: (_) {
            return const SizedBox.shrink();
          },
          orElse: () {
            return Column(
              children: [
                Visibility(
                  visible: menusState is ResourcesLoading,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: const LinearProgressIndicator(),
                ),
                DSTable(
                  args: DSTableArgs(
                    header: DSText.headline5('Menus'),
                    actions: [
                      const NewMenuButton(),
                    ],
                    columns: [
                      const DSTableHeader(name: 'Name'),
                      const DSTableHeader(name: 'Last Updated'),
                      const DSTableHeader(name: 'Actions'),
                    ],
                    source: DSTableDataSource(
                      emptyBuilder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(height: kMinInteractiveDimension),
                            DSText.bodyText1(
                              'No menus yet. Click "New" above to add a menu',
                            ),
                            const Divider(height: kMinInteractiveDimension),
                          ],
                        );
                      },
                      rows: menus
                          .map(
                            (e) => DSTableRow(
                              onSelectChanged: (selected) {
                                ActionService.run(
                                  () {
                                    GoRouter.of(context).goNamed(
                                      EditMenuScreen.routeName,
                                      params: {
                                        'id': e.id!,
                                      },
                                    );
                                  },
                                  () => AnalyticsService.track(
                                    message: Analytics.menusTabItemSelected,
                                  ),
                                );
                              },
                              cells: [
                                DSTableCell(
                                  builder: () => DSText.bodyText1(e.name),
                                ),
                                DSTableCell(
                                  builder: () {
                                    return DSText.bodyText1(
                                      e.updatedAt?.formatWith(
                                            'MM/dd/yy @ h:mm a',
                                          ) ??
                                          '',
                                    );
                                  },
                                ),
                                DSTableCell(
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
                                            () => GoRouter.of(context).goNamed(
                                              MenuPreviewScreen.routeName,
                                              params: {
                                                'id': e.id!,
                                              },
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
