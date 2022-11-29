import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';

class DSBackButton extends StatelessWidget {
  const DSBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(
          Icons.close,
          size: 24,
        ),
        splashRadius: 20,
        color: color,
        tooltip: 'Close',
        onPressed: () => Locator.instance<NavigatorHelper>().goHome(),
      ),
    );
  }
}
