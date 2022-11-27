import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewMenuButton extends StatelessWidget {
  const NewMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocProvider.value(
    //   value: context.read<CreateMenuCubit>(),
    //   child: const _NewMenuButton(),
    // );
    return const _NewMenuButton();
  }
}

class _NewMenuButton extends HookWidget {
  const _NewMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final createMenuState = context.watch<CreateMenuCubit>().state;

    return PageActionButton(
      title: 'New',
      // isDisabled: createMenuState.maybeWhen(
      //   orElse: () => false,
      //   creating: (_) => true,
      // ),
      onPressed: () {
        // context.read<CreateMenuCubit>().create();
        GoRouter.of(context).pushNamed(CreateMenuScreen.routeName);
      },
    );
  }
}
