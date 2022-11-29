import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/domain/core/action_object.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_core/meny_core.dart';

class PreviewMenuButton extends StatelessWidget {
  const PreviewMenuButton({Key? key, required this.menu}) : super(key: key);
  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return DSButton(
      theme: DSButtonThemeData.text(
        textTheme: const DSButtonThemeData.text().textTheme.copyWith(
              decoration: TextDecoration.underline,
            ),
      ),
      text: 'Preview',
      onPressed: () {
        ActionObject(
          eventName: Analytics.menusTabPreviewTapped,
          params: {
            'menuId': menu.id!,
            'menuName': menu.name,
          },
          callback: () => Locator.instance<NavigatorHelper>().goNamed(
            MenuPreviewScreen.routeName,
            params: {
              'id': menu.id!,
            },
          ),
        );
      },
    );
  }
}
