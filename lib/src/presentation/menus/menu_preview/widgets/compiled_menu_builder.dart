import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
import 'package:meny/src/presentation/menus/items/image_upload/image_display_card.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/services/services.dart';

class CompiledMenuBuilder extends StatelessWidget {
  const CompiledMenuBuilder({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final MenuModel menu;

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

  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompiledMenuCubit, CompiledMenuState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: (_) => const LinearProgressIndicator(),
          error: (_, exception) => ErrorDisplay(
            failure: Failure(message: exception.toString()),
          ),
          loaded: (response) {
            final data = response.value2;

            return MultiBlocListener(
              listeners: [
                BlocListener<ReorderCompiledCategoryCubit,
                    ReorderCompiledCategoryState>(
                  listener: (context, state) {
                    state.maybeMap(
                      success: (_) {
                        ToastService.showNotification(
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
                        ToastService.showNotification(
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
                buildDefaultDragHandles: false,
                itemCount: data.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, i) {
                  final category = data[i].value1;
                  final items = data[i].value2;
                  return ReorderableListView.builder(
                    key: Key(category.id!),
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
                    itemBuilder: (context, i) {
                      final item = items[i];
                      return Container(
                        key: Key(item.id!),
                        height: 100,
                        color: Colors.white,
                        padding: const EdgeInsets.all(Spacing.pageSpacing),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item.imageUrl != null &&
                                item.imageUrl!.isNotEmpty) ...[
                              ImageDisplayCard.forMenuDisplay(
                                url: item.imageUrl ?? '',
                              ),
                            ],
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Spacing.pageSpacing,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                          Text(
                                            item.description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(item.price.toCurrency()),
                                  ],
                                ),
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
                      context.read<ReorderCompiledMenuItemCubit>().reorder(
                            category: category,
                            items: items,
                          );
                    },
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final category = data.removeAt(oldIndex);
                  data.insert(newIndex, category);
                  context.read<ReorderCompiledCategoryCubit>().reorder(
                        menuId: menu.id!,
                        categories: data.map((e) => e.value1).toList(),
                      );
                },
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
