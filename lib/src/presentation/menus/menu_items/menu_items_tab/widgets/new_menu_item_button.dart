import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
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
        Locator.instance<NavigatorHelper>()
            .goNamed(CreateMenuItemScreen.routeName);
      },
    );
  }
}
