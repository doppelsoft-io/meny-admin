import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/presentation/resources/cubit/resources_cubit.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenusScreenCategoriesTab extends StatelessWidget {
  const MenusScreenCategoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResourcesCubit>(
      create: (context) => ResourcesCubit<CategoryModel>.use(),
      child: _MenusScreenCategoriesTab(),
    );
  }
}

class _MenusScreenCategoriesTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesState = context.watch<ResourcesCubit>().state;
    final categories = List<CategoryModel>.from(categoriesState.resources);

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
        child: DTable(
          args: DTableArgs(
            header: DText.headline5('Categories'),
            actions: [
              PageActionButton(
                title: 'New',
                onPressed: () {
                  ActionService.run(
                    () => UpdateCategorySheet.open(
                      context: context,
                      resource: CategoryModel.empty(),
                    ),
                    () => AnalyticsService.track(
                      message: Analytics.categoriesTabNewTapped,
                    ),
                  );
                },
              ),
            ],
            columns: [
              const DTableHeader(name: 'Name'),
              const DTableHeader(name: 'Last Updated'),
            ],
            source: DTableDataSource(
              emptyBuilder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(height: kMinInteractiveDimension),
                    DText.bodyText1(
                      'No categories yet. Click "New" above to add a category',
                    ),
                    const Divider(height: kMinInteractiveDimension),
                  ],
                );
              },
              rows: categories
                  .map(
                    (e) => DTableRow(
                      onSelectChanged: (selected) => ActionService.run(
                        () => UpdateCategorySheet.open(
                          context: context,
                          resource: e,
                        ),
                        () => AnalyticsService.track(
                          message: Analytics.categoriesTabItemSelected,
                          params: {
                            'categoryId': e.id!,
                            'categoryName': e.name,
                          },
                        ),
                      ),
                      cells: [
                        DTableCell(
                          builder: () {
                            return DText.bodyText1(e.name);
                          },
                        ),
                        DTableCell(
                          builder: () {
                            return DText.bodyText1(
                              e.updatedAt?.formatWith('MM/dd/yy @ h:mm a') ??
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
      ),
    );
  }
}
