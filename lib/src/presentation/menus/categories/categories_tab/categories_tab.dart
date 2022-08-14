import 'package:data_table_2/data_table_2.dart';
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
        loading: (_) => const Center(child: CircularProgressIndicator()),
        loaded: (categories) {
          return ResourceTable<CategoryModel>(
            header: const PageTitle(
              title: 'Categories',
            ),
            action: const NewCategoryButton(),
            columns: const [
              DataColumn2(
                label: Text('Name'),
                size: ColumnSize.L,
              ),
            ],
            resources: categories,
            emptyMessage:
                'No categories yet. Click "New" above to get started!',
            onTapItem: (context, category) {
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
            },
            cellsBuilder: (context, category) {
              return <DataCell>[
                DataCell(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(category.name),
                      DSText.caption(
                        'Last updated: ${category.updatedAt?.formatWith(
                              'MM/dd/yy @ h:mm a',
                            ) ?? ''}',
                      ),
                    ],
                  ),
                ),
              ];
            },
          );
        },
        orElse: SizedBox.shrink,
      ),
    );
  }
}
