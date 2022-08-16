import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_core/meny_core.dart';

class CompiledMenuBuilder extends StatelessWidget {
  const CompiledMenuBuilder({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final CompiledMenuModel menu;

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
      child: _CompiledMenuBuilder(menu: menu),
    );
  }
}

class _CompiledMenuBuilder extends StatelessWidget {
  const _CompiledMenuBuilder({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final CompiledMenuModel menu;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompiledMenuCubit, CompiledMenuState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (_, exception) {
            DialogService.showErrorDialog(
              context: context,
              failure: CustomException(
                message: exception.toString(),
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (_) => const LinearProgressIndicator(),
          orElse: () {
            final categories =
                List<CompiledCategoryModel>.from(state.response.categories);

            return MultiBlocListener(
              listeners: [
                BlocListener<ReorderCompiledCategoryCubit,
                    ReorderCompiledCategoryState>(
                  listener: (context, state) {
                    state.maybeMap(
                      success: (_) {
                        Locator.instance<ToastService>().showNotification(
                          const Text('Categories saved'),
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
                        Locator.instance<ToastService>().showNotification(
                          const Text('Items saved'),
                        );
                      },
                      orElse: () {},
                    );
                  },
                ),
              ],
              child: ReorderableListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: DSSpacing.medium,
                  horizontal: DSSpacing.medium,
                ),
                shrinkWrap: true,
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final category = categories.removeAt(oldIndex);
                  categories.insert(newIndex, category);
                  context.read<ReorderCompiledCategoryCubit>().reorder(
                        menuId: menu.id,
                        categories: categories,
                      );

                  context.read<CompiledMenuCubit>().syncCategories(categories);
                },
                itemCount: categories.length,
                buildDefaultDragHandles: false,
                itemBuilder: (context, categoryIndex) {
                  final category = categories[categoryIndex];
                  final items = List<CompiledMenuItemModel>.from(
                    category.items,
                  );
                  return Container(
                    key: Key(category.id),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: ReorderableDragStartListener(
                                index: categoryIndex,
                                child: const Icon(Icons.menu, size: 28),
                              ),
                            ),
                            const SizedBox(width: DSSpacing.medium),
                            DSText.headline5(category.name),
                          ],
                        ),
                        ReorderableListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          buildDefaultDragHandles: false,
                          padding: const EdgeInsets.symmetric(
                            vertical: DSSpacing.large,
                          ),
                          itemCount: items.length,
                          itemBuilder: (context, itemIndex) {
                            final item = items[itemIndex];
                            return Container(
                              key: Key(item.id),
                              padding: const EdgeInsets.symmetric(
                                vertical: DSSpacing.medium,
                                horizontal: DSSpacing.small,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: ReorderableDragStartListener(
                                      index: itemIndex,
                                      child: const Icon(
                                        Icons.menu,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: DSSpacing.medium),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DSText.subtitle1(item.name),
                                        if (item.description != null &&
                                            item.description!.isNotEmpty) ...[
                                          const SizedBox(height: 2),
                                          DSText.bodyText1(
                                            item.description!,
                                          ),
                                        ],
                                        const SizedBox(height: 6),
                                        Text(
                                          (item.priceInfo.price / 100)
                                              .toCurrency(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: DSSpacing.medium),
                                  if (item.imageUrl != null &&
                                      item.imageUrl!.isNotEmpty)
                                    DSImageUploadCard(
                                      url: item.imageUrl ?? '',
                                      theme:
                                          DSImageUploadCardThemeData.fallback()
                                              .copyWith(
                                        width: 91,
                                        height: 73,
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                          onReorder: (oldIndex, newIndex) {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            final item = items.removeAt(oldIndex);
                            items.insert(newIndex, item);
                            context
                                .read<ReorderCompiledMenuItemCubit>()
                                .reorder(
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
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
