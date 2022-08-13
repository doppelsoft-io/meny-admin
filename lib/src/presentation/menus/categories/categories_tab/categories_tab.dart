import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(),
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
        loading: (_) => const LoadingTable(),
        orElse: () {
          return categoriesState.categories.isEmpty
              ? const NoResultsTable(
                  headline: 'Categories',
                  title: 'No categories yet',
                  message: 'Click "New" to create one!',
                  actions: [NewCategoryButton()],
                )
              : SingleChildScrollView(
                  child: DSTable(
                    args: DSTableArgs(
                      header: DSText.headline5('Categories'),
                      actions: [
                        const NewCategoryButton(),
                      ],
                      columns: [
                        const DSTableHeader(name: 'Name'),
                        const DSTableHeader(name: 'Last Updated'),
                      ],
                      source: DSTableDataSource(
                        emptyBuilder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(height: kMinInteractiveDimension),
                              DSText.bodyText1(
                                'No categories yet. Click "New" above to add a category',
                              ),
                              const Divider(height: kMinInteractiveDimension),
                            ],
                          );
                        },
                        rows: categoriesState.categories
                            .map(
                              (e) => DSTableRow(
                                onSelectChanged: (selected) =>
                                    ActionService.run(
                                  () {
                                    GoRouter.of(context).goNamed(
                                      EditCategoryScreen.routeName,
                                      params: {'id': e.id!},
                                    );
                                  },
                                  () => AnalyticsService.track(
                                    message:
                                        Analytics.categoriesTabItemSelected,
                                    params: {
                                      'categoryId': e.id!,
                                      'categoryName': e.name,
                                    },
                                  ),
                                ),
                                cells: [
                                  DSTableCell(
                                    builder: () {
                                      return DSText.bodyText1(e.name);
                                    },
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
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
