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
import 'package:responsive_framework/responsive_wrapper.dart';

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

    void _sort(
      int columnIndex,
      bool descending,
      String name,
    ) {
      final storeCubit = context.read<StoreCubit>();
      final storeId = storeCubit.state.store.id;
      context.read<CategoriesCubit>().load(
            storeId: storeId!,
            orderBy: OrderBy(
              name,
              descending: !descending,
              sortColumnIndex: columnIndex,
            ),
          );
    }

    void _onTapItem(BuildContext context, CategoryModel category) {
      ActionService.run(
        () {
          GoRouter.of(context).goNamed(
            EditCategoryScreen.routeName,
            params: {
              'id': category.id!,
            },
          );
        },
        () => AnalyticsService.track(
          message: Analytics.categoriesTabItemSelected,
        ),
      );
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
          const header = PageTitle(title: 'Categories');
          const emptyMessage =
              'No categories yet. Click "New" above to get started!';

          return Stack(
            children: [
              if (isMobile) ...[
                ResourceList<CategoryModel>(
                  header: header,
                  action: action,
                  resources: categories,
                  emptyMessage: emptyMessage,
                  onTapItem: _onTapItem,
                  itemBuilder: (_, category) {
                    return ListTile(
                      onTap: () => _onTapItem(context, category),
                      title: Text(category.name),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: DSSpacing.medium,
                        vertical: DSSpacing.smallest,
                      ),
                      subtitle: Text(
                        'Updated: ${category.updatedAt?.formatWith(
                              'MM/dd/yy @ h:mm a',
                            ) ?? ''}',
                      ),
                      isThreeLine: true,
                    );
                  },
                ),
              ] else ...[
                ResourceTable<CategoryModel>(
                  sortAscending: !orderBy.descending,
                  sortColumnIndex: orderBy.sortColumnIndex,
                  header: header,
                  action: action,
                  columns: [
                    DataColumn2(
                      label: DSText(
                        'NAME',
                        theme: DSTextThemeData.labelSmall(),
                      ),
                      size: ColumnSize.L,
                      onSort: (columnIndex, descending) =>
                          _sort(columnIndex, descending, 'name'),
                    ),
                    DataColumn2(
                      label: DSText(
                        'CREATED',
                        theme: DSTextThemeData.labelSmall(),
                      ),
                      fixedWidth: 200,
                      size: ColumnSize.S,
                      onSort: (columnIndex, descending) =>
                          _sort(columnIndex, descending, 'createdAt'),
                    ),
                  ],
                  resources: categories,
                  emptyMessage: emptyMessage,
                  onTapItem: _onTapItem,
                  cellsBuilder: (context, category) {
                    return <DataCell>[
                      DataCell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DSText(
                              category.name,
                              theme: DSTextThemeData.labelLarge(),
                            ),
                            DSText(
                              'Last updated: ${category.updatedAt?.formatWith(
                                    'MM/dd/yy @ h:mm a',
                                  ) ?? ''}',
                              theme: DSTextThemeData.bodySmall(),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        DSText(
                          category.createdAt?.formatWith(
                                'MM/dd/yy @ h:mm a',
                              ) ??
                              '',
                          theme: DSTextThemeData.bodyMedium(),
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
