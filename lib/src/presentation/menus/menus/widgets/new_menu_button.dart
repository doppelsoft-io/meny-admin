import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/app_router_web.dart';
import 'package:meny_admin/src/data/menus/menus.dart';
import 'package:meny_admin/src/data/stores/stores.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';

class NewMenuButton extends StatelessWidget {
  const NewMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateMenuCubit>(
      create: (context) => CreateMenuCubit(
        storeCubit: context.read<StoreCubit>(),
      ),
      child: const _NewMenuButton(),
    );
  }
}

class _NewMenuButton extends HookWidget {
  const _NewMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editMenuState = context.watch<CreateMenuCubit>().state;

    return BlocListener<CreateMenuCubit, CreateMenuState>(
      listenWhen: (prev, curr) => prev != curr,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          created: (menu) {
            context.router.navigate(
              AppScreenRoute(
                children: [
                  EditMenuScreenRoute(
                    // menu: menu,
                    id: menu.id!,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: PageActionButton(
        title: 'New',
        isDisabled: editMenuState.maybeWhen(
          orElse: () => false,
          creating: (_) => true,
        ),
        onPressed: () {
          context.read<CreateMenuCubit>().create();
        },
      ),
    );
  }
}
