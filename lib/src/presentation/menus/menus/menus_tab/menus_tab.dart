import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class MenusTab extends StatelessWidget {
  const MenusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenusCubit>(
          create: (context) => MenusCubit(
            authCubit: context.read<AuthCubit>(),
          ),
        ),
      ],
      child: _MenusScreenMenusTab(),
    );
  }
}

class _MenusScreenMenusTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final menusState = context.watch<MenusCubit>().state;

    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id;
        if (storeId != null) {
          context.read<MenusCubit>().load(storeId: storeId);
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
              context.read<MenusCubit>().load(storeId: state.store.id!);
            }
          },
        ),
      ],
      child: menusState.maybeWhen(
        loading: (_) => const LoadingTable(),
        orElse: () {
          return menusState.menus.isEmpty
              ? const NoResultsTable(
                  headline: 'Menus',
                  title: 'No menus yet',
                  message: 'Click "New" to create one!',
                  actions: [NewMenuButton()],
                )
              : SingleChildScrollView(
                  child: MenusTable(menus: menusState.menus),
                );
        },
      ),
    );
  }
}
