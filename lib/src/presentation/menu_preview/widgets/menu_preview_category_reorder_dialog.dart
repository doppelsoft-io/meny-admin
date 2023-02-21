import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class MenuPreviewCategoryReorderDialog extends StatelessWidget {
  const MenuPreviewCategoryReorderDialog({
    super.key,
    required this.menuId,
    required this.categories,
  });

  final String menuId;
  final List<CompiledCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReorderCompiledCategoryCubit>(
          create: (context) => ReorderCompiledCategoryCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
        BlocProvider<ReorderCompiledMenuItemCubit>(
          create: (context) => ReorderCompiledMenuItemCubit(
            storeCubit: context.read<StoreCubit>(),
          ),
        ),
      ],
      child: _MenuPreviewCategoryReorderDialog(
        menuId: menuId,
        categories: categories,
      ),
    );
  }
}

class _MenuPreviewCategoryReorderDialog extends StatelessWidget {
  const _MenuPreviewCategoryReorderDialog({
    required this.menuId,
    required this.categories,
  });

  final String menuId;
  final List<CompiledCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final categories = List<CompiledCategoryModel>.from(this.categories);

    const dragIcon = DSIcon(
      theme: DSIconThemeData(color: color, size: 18),
      iconData: FontAwesomeIcons.barsStaggered,
      semanticLabel: 'Reorder',
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<ReorderCompiledCategoryCubit,
            ReorderCompiledCategoryState>(
          listener: (context, state) {
            state.maybeMap(
              success: (_) {
                Locator.instance<ToastService>().init(
                  const DSToast.toast(text: 'Categories saved'),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<ReorderCompiledMenuItemCubit,
            ReorderCompiledMenuItemState>(
          listener: (context, state) {
            state.maybeMap(
              success: (_) {
                Locator.instance<ToastService>().init(
                  const DSToast.toast(text: 'Items saved'),
                );
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: DSModal(
        title: const DSText(
          'Reorder Categories',
          theme: DSTextThemeData.b1(),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: DSSpacing.lg,
                horizontal: DSSpacing.sm,
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Tip: Press and hold the '),
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: DSIcon(
                          theme: DSIconThemeData(color: color, size: 18),
                          iconData: FontAwesomeIcons.barsStaggered,
                          semanticLabel: 'Reorder',
                        ),
                      ),
                    ),
                    TextSpan(
                      text:
                          ' icons to drag and reorder you categories and menu items',
                    ),
                  ],
                ),
              ),
            ),
            // DSVerticalSpacing.small(),
            // Row(
            //   children: [
            //     DSButton(
            //       theme: DSButtonThemeData.text(
            //         foregroundColor: effectiveTheme.colorScheme.primary,
            //       ),
            //       text: 'Expand All',
            //       onPressed: () {},
            //     ),
            //     DSButton(
            //       theme: DSButtonThemeData.text(
            //         foregroundColor: effectiveTheme.colorScheme.primary,
            //       ),
            //       text: 'Collapse All',
            //       onPressed: () {},
            //     ),
            //   ],
            // ),
            // const Divider(),
            Expanded(
              child: ReorderableListView.builder(
                shrinkWrap: true,
                buildDefaultDragHandles: false,
                itemCount: categories.length,
                itemBuilder: (context, categoryIndex) {
                  final category = categories[categoryIndex];
                  final items =
                      List<CompiledMenuItemModel>.from(category.items);
                  return ExpansionTile(
                    maintainState: true,
                    key: Key(category.id),
                    textColor: blackColor,
                    collapsedTextColor: blackColor,
                    iconColor: blackColor,
                    collapsedIconColor: blackColor,
                    childrenPadding: const EdgeInsets.all(DSSpacing.sm),
                    leading: ReorderableDragStartListener(
                      index: categoryIndex,
                      child: dragIcon,
                    ),
                    title: DSText(
                      category.name,
                      theme: const DSTextThemeData.b4(),
                    ),
                    children: [
                      ReorderableListView.builder(
                        shrinkWrap: true,
                        buildDefaultDragHandles: false,
                        itemCount: items.length,
                        itemBuilder: (context, itemIndex) {
                          final item = items[itemIndex];
                          return Material(
                            key: Key(item.id),
                            elevation: 1,
                            child: DSListTile(
                              args: DSListTileArgs(
                                leading: ReorderableDragStartListener(
                                  index: itemIndex,
                                  child: dragIcon,
                                ),
                                title: item.name,
                              ),
                            ),
                          );
                        },
                        onReorder: (oldIndex, newIndex) {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final item = items.removeAt(oldIndex);
                          items.insert(newIndex, item);
                          context.read<ReorderCompiledMenuItemCubit>().reorder(
                                category: category,
                                items: items,
                              );

                          final updatedCategories = categories
                            ..remove(category)
                            ..insert(
                              categoryIndex,
                              category.copyWith(items: items),
                            );
                          context
                              .read<CompiledMenuCubit>()
                              .syncCategories(updatedCategories);
                        },
                      )
                    ],
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final category = categories.removeAt(oldIndex);
                  categories.insert(newIndex, category);
                  context.read<ReorderCompiledCategoryCubit>().reorder(
                        menuId: menuId,
                        categories: categories,
                      );

                  context.read<CompiledMenuCubit>().syncCategories(categories);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
