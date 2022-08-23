import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meny_admin/src/constants/analytics.dart';
import 'package:meny_admin/src/presentation/presentation.dart';
import 'package:meny_admin/src/services/services.dart';
import 'package:meny_admin/themes.dart';
import 'package:meny_core/meny_core.dart';

class PreviewMenuButton extends StatelessWidget {
  const PreviewMenuButton({Key? key, required this.menu}) : super(key: key);
  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return DSButton(
      type: DSButtonType.text,
      theme: DSButtonThemeData.fallback().copyWith(
        primary: Themes.primaryColor,
      ),
      child: const Text('Preview'),
      onPressed: () => ActionService.run(
        () => GoRouter.of(context).goNamed(
          MenuPreviewScreen.routeName,
          params: {
            'id': menu.id!,
          },
        ),
        () => AnalyticsService.track(
          message: Analytics.menusTabPreviewTapped,
          params: {
            'menuId': menu.id!,
            'menuName': menu.name,
          },
        ),
      ),
    );
  }
}
