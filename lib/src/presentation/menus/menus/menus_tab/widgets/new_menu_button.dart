import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewMenuButton extends StatelessWidget {
  const NewMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CreateMenuCubit>(),
      child: const _NewMenuButton(),
    );
  }
}

class _NewMenuButton extends HookWidget {
  const _NewMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createMenuState = context.watch<CreateMenuCubit>().state;

    return PageActionButton(
      title: 'New',
      isDisabled: createMenuState.maybeWhen(
        orElse: () => false,
        creating: (_) => true,
      ),
      onPressed: () {
        context.read<CreateMenuCubit>().create();
      },
    );
  }
}
