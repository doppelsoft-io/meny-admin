import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/compiled_menus/src/cubits/reorder_compiled_category/reorder_compiled_category_cubit.dart';
import 'package:meny/src/presentation/menus/menu_preview/widgets/widgets.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/services/services.dart';

class CompiledCategoryBuilder extends StatelessWidget {
  final String menuId;
  const CompiledCategoryBuilder({
    Key? key,
    required this.menuId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CompiledCategoryCubit>(
          create: (context) => CompiledCategoryCubit()..load(menuId: menuId),
        ),
        BlocProvider<ReorderCompiledCategoryCubit>(
          create: (context) => ReorderCompiledCategoryCubit(),
        ),
      ],
      child: BlocBuilder<CompiledCategoryCubit, CompiledCategoryState>(
        builder: (context, state) {
          switch (state.status) {
            case CompiledCategoryStatus.initial:
            case CompiledCategoryStatus.loading:
              return const LoadingDisplay(adaptive: true);
            case CompiledCategoryStatus.error:
              return ErrorDisplay(failure: state.failure!);
            case CompiledCategoryStatus.success:
              final categories = state.categories!;
              return BlocListener<ReorderCompiledCategoryCubit,
                  ReorderCompiledCategoryState>(
                listener: (context, state) {
                  if (state.status == ReorderCompiledCategoryStatus.success) {
                    ToastService.showNotification(
                        const Text('Categories saved'));
                  }
                },
                child: ReorderableListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, i) {
                    final category = categories[i];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      key: Key(category.id!),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Spacing.pageSpacing),
                          child: Text(
                            category.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Divider(height: 0),
                        CompiledMenuItemBuilder(
                          menuId: menuId,
                          categoryId: category.id!,
                        ),
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
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
