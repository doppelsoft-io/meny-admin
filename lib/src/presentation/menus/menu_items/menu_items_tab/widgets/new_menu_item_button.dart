import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewMenuItemButton extends StatelessWidget {
  const NewMenuItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _NewMenuItemButton();
  }
}

class _NewMenuItemButton extends HookWidget {
  const _NewMenuItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageActionButton(
      title: 'New',
      onPressed: () {
        GoRouter.of(context).pushNamed(CreateMenuItemScreen.routeName);
      },
    );
  }
}
