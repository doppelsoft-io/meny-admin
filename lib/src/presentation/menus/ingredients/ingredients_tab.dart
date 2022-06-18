import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/ingredients/ingredients.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/menus.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class IngredientsTab extends StatelessWidget {
  const IngredientsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IngredientsCubit>(
      create: (context) => IngredientsCubit(),
      child: BlocListener<StoreCubit, StoreState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (store) =>
                context.read<IngredientsCubit>().load(storeId: store.id!),
            orElse: () {},
          );
        },
        child: const _IngredientsTab(),
      ),
    );
  }
}

class _IngredientsTab extends HookWidget {
  const _IngredientsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredientsState = context.watch<IngredientsCubit>().state;

    useEffect(
      () {
        final storeState = context.read<StoreCubit>().state;
        final storeId = storeState.whenOrNull(loaded: (_) => _.id);
        if (storeId != null) {
          context.read<IngredientsCubit>().load(storeId: storeId);
        }
        return null;
      },
      const [],
    );
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(
            pinned: true,
            delegate: MenusPagePersistentHeaderDelegate(
              title: 'Ingredients',
              onNewPressed: () => ActionService.run(
                () => UpdateMenuItemSheet.open(
                  context: context,
                  resource: MenuItemModel.empty().copyWith(
                    type: MenuItemType.ingredient,
                  ),
                ),
                () => AnalyticsService.track(
                  message: Analytics.ingredientsTabNewTapped,
                ),
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(Spacing.pageSpacing),
        child: ingredientsState.maybeWhen(
          loading: (_) => Column(
            children: const [
              LinearProgressIndicator(),
            ],
          ),
          loaded: (ingredients) {
            return DataTable(
              showCheckboxColumn: false,
              showBottomBorder: true,
              columns: ingredients.isEmpty
                  ? [const DataColumn(label: Text('Name'))]
                  : const [
                      DataColumn(label: Text('Name')),
                      DataColumn(
                        label: Text(
                          'Price',
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Last Updated',
                        ),
                      ),
                    ],
              rows: ingredients.isEmpty
                  ? [
                      const DataRow(
                        cells: [
                          DataCell(
                            Text(
                              'Ingredients you create will appear here! Click "New" to add one.',
                            ),
                          )
                        ],
                      )
                    ]
                  : ingredients
                      .map(
                        (e) => DataRow(
                          onSelectChanged: (selected) {
                            ActionService.run(
                              () => UpdateMenuItemSheet.open(
                                context: context,
                                resource: e,
                              ),
                              () => AnalyticsService.track(
                                message:
                                    Analytics.ingredientsTabIngredientSelected,
                                params: {
                                  'itemId': e.id!,
                                  'itemName': e.name,
                                },
                              ),
                            );
                          },
                          cells: [
                            DataCell(Text(e.name)),
                            DataCell(
                              Text(
                                (e.priceInfo.price / 100).toCurrency(),
                              ),
                            ),
                            DataCell(
                              Text(
                                e.updatedAt?.formatWith('MM/dd/yy @ h:mm a') ??
                                    '',
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
            );
          },
          orElse: SizedBox.shrink,
        ),
      ),
    );
  }
}
