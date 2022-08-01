import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewMenuItemButton extends StatelessWidget {
  const NewMenuItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CreateMenuItemCubit>(),
      child: const _NewMenuItemButton(),
    );
  }
}

class _NewMenuItemButton extends HookWidget {
  const _NewMenuItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateMenuItemCubit>().state;

    return PageActionButton(
      title: 'New',
      isDisabled: state.maybeWhen(
        orElse: () => false,
        creating: (_) => true,
      ),
      onPressed: () {
        context.read<CreateMenuItemCubit>().create();
      },
    );
  }
}
