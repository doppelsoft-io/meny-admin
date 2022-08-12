import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/infrastructure/infrastructure.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_core/meny_core.dart';

class MenusTab extends StatelessWidget {
  const MenusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ResourcesCubit>(
          create: (context) => ResourcesCubit<MenuModel>(
            iResourcesRepository: Locator.instance<MenuRepository>(),
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
    final menusState = context.watch<ResourcesCubit>().state;
    final menus = List<MenuModel>.from(menusState.resources);

    useEffect(
      () {
        final storeCubit = context.read<StoreCubit>();
        final storeId = storeCubit.state.store.id;
        if (storeId != null) {
          context.read<ResourcesCubit>().load(storeId: storeId);
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
              context.read<ResourcesCubit>().load(storeId: state.store.id!);
            }
          },
        ),
      ],
      child: menusState is ResourcesLoading
          ? Column(
              children: const [
                LinearProgressIndicator(),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  if (menusState.resources.isEmpty)
                    const NoResultsTable(
                      headline: 'Menus',
                      title: 'No menus yet',
                      message: 'Click "New" to create one!',
                      actions: [NewMenuButton()],
                    )
                  else
                    MenusTable(menus: menus),
                ],
              ),
            ),
    );
  }
}
