import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meny_admin/src/application/application.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewCategoryButton extends StatelessWidget {
  const NewCategoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CreateCategoryCubit>(),
      child: const _NewCategoryButton(),
    );
  }
}

class _NewCategoryButton extends HookWidget {
  const _NewCategoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createCategoryState = context.watch<CreateCategoryCubit>().state;

    return PageActionButton(
      title: 'New',
      isDisabled: createCategoryState.maybeWhen(
        orElse: () => false,
        creating: (_) => true,
      ),
      onPressed: () {
        context.read<CreateCategoryCubit>().create();
      },
    );
  }
}
