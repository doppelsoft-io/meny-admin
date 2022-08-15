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

class MenuItemsTab extends StatelessWidget {
  const MenuItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuItemsCubit>(
          create: (context) => MenuItemsCubit(
            authCubit: context.read<AuthCubit>(),
          ),
        ),
      ],
      child: _MenusScreenItemsTab(),
    );
  }
}

class _MenusScreenItemsTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final menuItemsState = context.watch<MenuItemsCubit>().state;

    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id;
        if (storeId != null) {
          context.read<MenuItemsCubit>().load(storeId: storeId);
        }
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
      context.read<MenuItemsCubit>().load(
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
            if (state.store.id != null) {
              context.read<MenuItemsCubit>().load(storeId: state.store.id!);
            }
          },
        ),
      ],
      child: menuItemsState.maybeWhen(
        orElse: () {
          final items = menuItemsState.items;
          final orderBy = menuItemsState.orderBy;

          return ResourceTable<MenuItemModel>(
            header: const PageTitle(title: 'Items'),
            action: const NewMenuItemButton(),
            resources: items,
            sortColumnIndex: orderBy.sortColumnIndex,
            sortAscending: !orderBy.descending,
            columns: [
              const DataColumn2(
                label: Text('Photo'),
                fixedWidth: 75,
              ),
              DataColumn2(
                label: const Text('Price'),
                fixedWidth: 125,
                onSort: (columnIndex, descending) =>
                    _sort(columnIndex, descending, 'priceInfo.price'),
                numeric: true,
              ),
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
            ],
            cellsBuilder: (_, item) {
              return [
                DataCell(
                  DSImageUploadCard(
                    theme: DSImageUploadCardThemeData.thumbnail(),
                    url: item.imageUrl ?? '',
                  ),
                ),
                DataCell(
                  Text((item.priceInfo.price / 100).toCurrency()),
                ),
                DataCell(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DSText.bodyText1(item.name),
                      DSText.caption(
                        'Updated: ${item.updatedAt?.formatWith(
                              'MM/dd/yy @ h:mm a',
                            ) ?? ''}',
                      ),
                    ],
                  ),
                ),
                DataCell(
                  Text(
                    item.createdAt?.formatWith(
                          'MM/dd/yy @ h:mm a',
                        ) ??
                        '',
                  ),
                ),
              ];
            },
            onTapItem: (_, item) {
              ActionService.run(
                () {
                  GoRouter.of(context).pushNamed(
                    EditMenuItemScreen.routeName,
                    params: {
                      'id': item.id!,
                    },
                  );
                },
                () => AnalyticsService.track(
                  message: Analytics.ingredientsTabIngredientSelected,
                  params: {
                    'itemId': item.id!,
                    'itemName': item.name,
                  },
                ),
              );
            },
            emptyMessage: 'No items yet. Click "New" above to get started!',
          );
        },
      ),
    );
  }
}
