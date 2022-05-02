import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/data/compiled_menus/compiled_menus.dart';
import 'package:meny/src/data/compiled_menus/src/cubits/reorder_compiled_menu_item/reorder_compiled_menu_item_cubit.dart';
import 'package:meny/src/presentation/shared/shared.dart';
import 'package:meny/src/services/services.dart';

class CompiledMenuItemBuilder extends StatelessWidget {
  final String menuId;
  final String categoryId;

  const CompiledMenuItemBuilder({
    Key? key,
    required this.menuId,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CompiledMenuItemCubit>(
          create: (context) => CompiledMenuItemCubit()
            ..load(
              menuId: menuId,
              categoryId: categoryId,
            ),
        ),
        BlocProvider<ReorderCompiledMenuItemCubit>(
          create: (context) => ReorderCompiledMenuItemCubit(),
        ),
      ],
      child: BlocBuilder<CompiledMenuItemCubit, CompiledMenuItemState>(
        builder: (context, state) {
          switch (state.status) {
            case CompiledMenuItemStatus.initial:
            case CompiledMenuItemStatus.loading:
              return const LoadingDisplay(adaptive: true);
            case CompiledMenuItemStatus.error:
              return ErrorDisplay(failure: state.failure!);
            case CompiledMenuItemStatus.success:
              final items = state.items!;
              return BlocListener<ReorderCompiledMenuItemCubit,
                  ReorderCompiledMenuItemState>(
                listener: (context, state) {
                  if (state.status == ReorderCompiledMenuItemStatus.success) {
                    ToastService.showNotification(const Text('Items saved'));
                  }
                },
                child: ReorderableListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    final item = items[i];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Spacing.pageSpacing,
                      ),
                      key: Key(item.id!),
                      title: Text(
                        item.name,
                      ),
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
                          menuId: menuId,
                          categoryId: categoryId,
                          items: items,
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
