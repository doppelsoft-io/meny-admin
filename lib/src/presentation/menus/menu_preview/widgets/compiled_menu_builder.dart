import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/core/failures.dart';
import 'package:meny/src/data/menus/menus.dart';
import 'package:meny/src/data/stores/stores.dart';
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
      child: const _CompiledMenuBuilder(),
    );
  }
}

class _CompiledMenuBuilder extends StatelessWidget {
  const _CompiledMenuBuilder({Key? key}) : super(key: key);

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
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, i) {
                  final category = data[i].value1;
                  final items = data[i].value2;
                  return ReorderableListView.builder(
                    key: Key(category.id!),
                    shrinkWrap: true,
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    header: Padding(
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
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Spacing.pageSpacing,
                        ),
                        key: Key(item.id!),
                        title: Text(item.name),
                        subtitle: Text(item.description),
                        trailing: Text(item.price.toCurrency()),
                      );
                    },
                    onReorder: (oldIndex, newIndex) {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final item = items.removeAt(oldIndex);
                      items.insert(newIndex, item);
                      context.read<ReorderCompiledMenuItemCubit>().reorder(
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
