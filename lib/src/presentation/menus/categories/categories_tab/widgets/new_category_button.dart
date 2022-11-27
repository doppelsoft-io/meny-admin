import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewCategoryButton extends StatelessWidget {
  const NewCategoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _NewCategoryButton();
  }
}

class _NewCategoryButton extends HookWidget {
  const _NewCategoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageActionButton(
      title: 'New',
      onPressed: () {
        GoRouter.of(context).pushNamed(CreateCategoryScreen.routeName);
      },
    );
  }
}
