import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';
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
    return BlocBuilder<CompiledMenuCubit, CompiledMenuState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: (_) => const LinearProgressIndicator(),
          error: (_, exception) => ErrorDisplay(
            exception: CustomException(message: exception.toString()),
          ),
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
                key: const Key('main-one'),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, categoryIndex) {
                  final category = categories[categoryIndex];
                  final items =
                      List<CompiledMenuItemModel>.from(category.items);
                  return ReorderableListView.builder(
                    key: Key(category.id),
                    shrinkWrap: true,
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    header: Container(
                      padding: const EdgeInsets.all(Spacing.pageSpacing),
                      child: Text(
                        category.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    itemBuilder: (context, itemIndex) {
                      final item = items[itemIndex];
                      return Container(
                        key: Key(item.id),
                        padding: const EdgeInsets.all(Spacing.pageSpacing),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Spacing.pageSpacing,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    if (item.description != null &&
                                        item.description!.isNotEmpty) ...[
                                      const SizedBox(height: 2),
                                      Text(
                                        item.description!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                    const SizedBox(height: 6),
                                    Text(
                                      (item.priceInfo.price / 100).toCurrency(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (item.imageUrl != null &&
                                item.imageUrl!.isNotEmpty)
                              DImageUploadCard(
                                url: item.imageUrl ?? '',
                                theme: DImageUploadCardThemeData.fallback()
                                    .copyWith(
                                  width: 91,
                                  height: 73,
                                ),
                              ),
                            const SizedBox(width: Spacing.pageSpacing),
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
                  );
                },
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
              ),
            );
          },
        );
      },
    );
  }
}
