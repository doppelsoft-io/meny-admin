import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/core/action_object.dart';
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
      onPressed: () => ActionObject(
        () => Locator.instance<NavigatorHelper>()
            .goNamed(CreateMenuItemScreen.routeName),
        event: const DSEvent(Analytics.itemsTabNewTapped),
      ),
    );
  }
}
