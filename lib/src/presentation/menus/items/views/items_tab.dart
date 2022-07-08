import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/data/menu_items/menu_items.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/menus/items/widgets/new_menu_item_button.dart';
import 'package:meny_admin/src/screens/screens.dart';
import 'package:meny_admin/src/services/services.dart';

class MenusScreenItemsTab extends StatelessWidget {
  const MenusScreenItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuItemsCubit>(
          create: (context) => MenuItemsCubit(),
        ),
        BlocProvider<CreateMenuItemCubit>(
          create: (context) => CreateMenuItemCubit(
            storeCubit: context.read<StoreCubit>(),
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
        BlocListener<CreateMenuItemCubit, CreateMenuItemState>(
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
                  EditMenuItemScreen.routeName,
                  params: {
                    'id': menu.id!,
                  },
                );
              },
            );
          },
        ),
      ],
      child: menuItemsState.maybeWhen(
        loaded: (items) {
          return SingleChildScrollView(
            child: DTable(
              theme: DTableThemeData.fallback().copyWith(
                rowHeight: 64,
              ),
              args: DTableArgs(
                header: DText.headline5('Items'),
                actions: [
                  const NewMenuItemButton(),
                ],
                columns: [
                  const DTableHeader(name: 'Photo'),
                  const DTableHeader(name: 'Name'),
                  const DTableHeader(name: 'Price'),
                  const DTableHeader(name: 'Last Updated'),
                ],
                source: DTableDataSource(
                  emptyBuilder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(height: kMinInteractiveDimension),
                        DText.bodyText1(
                          'No items yet. Click "New" above to add an item',
                        ),
                        const Divider(height: kMinInteractiveDimension),
                      ],
                    );
                  },
                  rows: items
                      .map(
                        (i) => DTableRow(
                          onSelectChanged: (selected) {
                            ActionService.run(
                              () {
                                GoRouter.of(context).pushNamed(
                                  EditMenuItemScreen.routeName,
                                  params: {
                                    'id': i.id!,
                                  },
                                );
                              },
                              () => AnalyticsService.track(
                                message:
                                    Analytics.ingredientsTabIngredientSelected,
                                params: {
                                  'itemId': i.id!,
                                  'itemName': i.name,
                                },
                              ),
                            );
                          },
                          cells: [
                            DTableCell(
                              builder: () {
                                return DImageUploadCard(
                                  theme: DImageUploadCardThemeData.thumbnail(),
                                  url: i.imageUrl ?? '',
                                );
                              },
                            ),
                            DTableCell(
                              builder: () {
                                return DText.bodyText1(i.name);
                              },
                            ),
                            DTableCell(
                              builder: () {
                                return DText.bodyText1(
                                  (i.priceInfo.price / 100).toCurrency(),
                                );
                              },
                            ),
                            DTableCell(
                              builder: () {
                                return DText.bodyText1(
                                  i.updatedAt?.formatWith(
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
        orElse: SizedBox.shrink,
      ),
    );
  }
}
