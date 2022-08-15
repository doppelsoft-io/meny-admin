import 'package:data_table_2/data_table_2.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusTab extends StatelessWidget {
  const MenusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenusCubit>(
          create: (context) => MenusCubit(
            authCubit: context.read<AuthCubit>(),
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
    final storeState = context.watch<StoreCubit>().state;
    final menusState = context.watch<MenusCubit>().state;

    useEffect(
      () {
        storeState.maybeWhen(
          loaded: (store) {
            context.read<MenusCubit>().load(storeId: store.id!);
          },
          orElse: () {},
        );
        return null;
      },
      const [],
    );

    void _sort(
      int columnIndex,
      bool descending,
      String name,
    ) {
      final storeCubit = context.read<StoreCubit>();
      final storeId = storeCubit.state.store.id;
      context.read<MenusCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<StoreCubit, StoreState>(
          listenWhen: (prev, curr) => prev.store != curr.store,
          listener: (context, state) {
            state.maybeWhen(
              loaded: (store) {
                context.read<MenusCubit>().load(storeId: state.store.id!);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: menusState.maybeWhen(
        loaded: (menus, orderBy) {
          return ResourceTable<MenuModel>(
            sortColumnIndex: orderBy.sortColumnIndex,
            sortAscending: !orderBy.descending,
            header: const PageTitle(title: 'Menus'),
            action: const NewMenuButton(),
            resources: menus,
            columns: [
              DataColumn2(
                label: const Text('Name'),
                size: ColumnSize.L,
                onSort: (columnIndex, descending) =>
                    _sort(columnIndex, descending, 'name'),
              ),
              DataColumn2(
                label: const Text('Created'),
                fixedWidth: 200,
                size: ColumnSize.S,
                onSort: (columnIndex, descending) =>
                    _sort(columnIndex, descending, 'createdAt'),
              ),
              const DataColumn2(
                label: Text(''),
                fixedWidth: 100,
                size: ColumnSize.S,
              ),
            ],
            cellsBuilder: (_, menu) {
              return <DataCell>[
                DataCell(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(menu.name),
                      DSText.caption(
                        'Last updated: ${menu.updatedAt?.formatWith(
                              'MM/dd/yy @ h:mm a',
                            ) ?? ''}',
                      ),
                    ],
                  ),
                ),
                DataCell(
                  Text(
                    menu.createdAt?.formatWith(
                          'MM/dd/yy @ h:mm a',
                        ) ??
                        '',
                  ),
                ),
                DataCell(
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
                          'id': menu.id!,
                        },
                      ),
                      () => AnalyticsService.track(
                        message: Analytics.menusTabPreviewTapped,
                        params: {
                          'menuId': menu.id!,
                          'menuName': menu.name,
                        },
                      ),
                    ),
                  ),
                ),
              ];
            },
            emptyMessage: 'No menus yet. Click "New" above to get started!',
            onTapItem: (_, menu) {
              ActionService.run(
                () {
                  GoRouter.of(context).goNamed(
                    EditMenuScreen.routeName,
                    params: {
                      'id': menu.id!,
                    },
                  );
                },
                () => AnalyticsService.track(
                  message: Analytics.menusTabItemSelected,
                ),
              );
            },
          );
        },
        orElse: SizedBox.shrink,
      ),
    );
  }
}
