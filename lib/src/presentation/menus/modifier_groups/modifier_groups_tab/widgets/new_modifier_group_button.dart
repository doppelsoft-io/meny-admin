import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewModifierGroupButton extends StatelessWidget {
  const NewModifierGroupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CreateModifierGroupCubit>(),
      child: const _NewModifierGroupButton(),
    );
  }
}

class _NewModifierGroupButton extends HookWidget {
  const _NewModifierGroupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createMenuState = context.watch<CreateModifierGroupCubit>().state;

    return PageActionButton(
      title: 'New',
      isDisabled: createMenuState.maybeWhen(
        orElse: () => false,
        creating: (_) => true,
      ),
      onPressed: () {
        context.read<CreateModifierGroupCubit>().create();
      },
    );
  }
}
