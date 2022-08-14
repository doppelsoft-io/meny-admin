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
    final storeState = context.watch<StoreCubit>().state;
    final menusState = context.watch<MenusCubit>().state;

    useEffect(
      () {
        storeState.maybeWhen(
          loaded: (store) {
            context.read<MenusCubit>().load(storeId: store.id!);
          },
          orElse: () {},
        );
        return null;
      },
      const [],
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<StoreCubit, StoreState>(
          listenWhen: (prev, curr) => prev.store != curr.store,
          listener: (context, state) {
            state.maybeWhen(
              loaded: (store) {
                context.read<MenusCubit>().load(storeId: state.store.id!);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: menusState.maybeWhen(
        loading: (_) => const Center(child: CircularProgressIndicator()),
        loaded: (menus) => MenusTable(menus: menus),
        orElse: SizedBox.shrink,
      ),
    );
  }
}
