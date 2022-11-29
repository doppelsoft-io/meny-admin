import 'package:data_table_2/data_table_2.dart';
import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_core/meny_core.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(
            authCubit: context.read<AuthCubit>(),
          ),
        ),
      ],
      child: _MenusScreenCategoriesTab(),
    );
  }
}

class _MenusScreenCategoriesTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesState = context.watch<CategoriesCubit>().state;

    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id;
        if (storeId != null) {
          context.read<CategoriesCubit>().load(storeId: storeId);
        }
        return null;
      },
      const [],
    );

    void sort({
      required int columnIndex,
      required bool descending,
      required String name,
    }) {
      final storeCubit = context.read<StoreCubit>();
      final storeId = storeCubit.state.store.id;
      context.read<CategoriesCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              field: name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    void onTapItem(BuildContext context, CategoryModel category) {
      ActionObject(
        eventName: Analytics.categoriesTabItemSelected,
        callback: () {
          Locator.instance<NavigatorHelper>().goNamed(
            EditCategoryScreen.routeName,
            params: {
              'id': category.id!,
            },
          );
        },
      ).call();
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<StoreCubit, StoreState>(
          listenWhen: (prev, curr) => prev.store != curr.store,
          listener: (context, state) {
            if (state.store.id != null) {
              context.read<CategoriesCubit>().load(storeId: state.store.id!);
            }
          },
        ),
      ],
      child: categoriesState.maybeWhen(
        orElse: () {
          final isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
          final categories = categoriesState.categories;
          final orderBy = categoriesState.orderBy;
          const action = NewCategoryButton();
          const emptyMessage =
              'No categories yet. Click "New" above to get started!';

          return Stack(
            children: [
              if (isMobile) ...[
                ResourceList<CategoryModel>(
                  title: 'Categories',
                  action: action,
                  resources: categories,
                  emptyMessage: emptyMessage,
                  itemBuilder: (_, category) {
                    return DSListTile(
                      args: DSListTileArgs(
                        onTap: () => onTapItem(context, category),
                        title: category.name,
                        subtitle:
                            Text('Updated: ${category.updatedAt?.format()}'),
                      ),
                    );
                  },
                ),
              ] else ...[
                ResourceTable<CategoryModel>(
                  title: 'Categories',
                  sortAscending: !orderBy.descending,
                  sortColumnIndex: orderBy.sortColumnIndex,
                  action: action,
                  columns: [
                    DataColumn2(
                      label: const DSText(
                        'NAME',
                        theme: DSTextThemeData.c2(),
                      ),
                      size: ColumnSize.L,
                      onSort: (columnIndex, descending) => sort(
                        columnIndex: columnIndex,
                        descending: descending,
                        name: 'name',
                      ),
                    ),
                    DataColumn2(
                      label: const DSText(
                        'CREATED',
                        theme: DSTextThemeData.c2(),
                      ),
                      fixedWidth: 200,
                      size: ColumnSize.S,
                      onSort: (columnIndex, descending) => sort(
                        columnIndex: columnIndex,
                        descending: descending,
                        name: 'createdAt',
                      ),
                    ),
                  ],
                  resources: categories,
                  emptyMessage: emptyMessage,
                  onTapItem: onTapItem,
                  cellsBuilder: (context, category) {
                    return <DataCell>[
                      DataCell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DSText(
                              category.name,
                              theme: const DSTextThemeData.b4(),
                            ),
                            DSText(
                              'Last updated: ${category.updatedAt?.format()}',
                              theme: const DSTextThemeData.c2(),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        DSText(
                          category.createdAt?.format() ?? '',
                          theme: const DSTextThemeData.b5(),
                        ),
                      ),
                    ];
                  },
                ),
              ],
              Visibility(
                maintainAnimation: true,
                maintainInteractivity: true,
                maintainSemantics: true,
                maintainSize: true,
                maintainState: true,
                visible: categoriesState.maybeWhen(
                  loading: (_, __) => true,
                  orElse: () => false,
                ),
                child: const LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
