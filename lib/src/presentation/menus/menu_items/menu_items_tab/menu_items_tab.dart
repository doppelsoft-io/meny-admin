import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class MenuItemsTab extends StatelessWidget {
  const MenuItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuItemsCubit>(
          create: (context) => MenuItemsCubit(
            authCubit: context.read<AuthCubit>(),
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
      ],
      child: menuItemsState.maybeWhen(
        loading: (_) => const LoadingTable(),
        orElse: () {
          return menuItemsState.items.isEmpty
              ? const NoResultsTable(
                  headline: 'Items',
                  title: 'No menu items yet',
                  message: 'Click "New" to create one!',
                  actions: [NewMenuItemButton()],
                )
              : SingleChildScrollView(
                  child: MenuItemsTable(
                    items: menuItemsState.items,
                  ),
                );
        },
      ),
    );
  }
}
