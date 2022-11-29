import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/domain.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class NewModifierGroupButton extends StatelessWidget {
  const NewModifierGroupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _NewModifierGroupButton();
  }
}

class _NewModifierGroupButton extends HookWidget {
  const _NewModifierGroupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageActionButton(
      title: 'New',
      onPressed: ActionObject(
        eventName: Analytics.modifierGroupsTabNewTapped,
        callback: () {
          Locator.instance<NavigatorHelper>()
              .goNamed(CreateModifierGroupScreen.routeName);
        },
      ),
    );
  }
}
