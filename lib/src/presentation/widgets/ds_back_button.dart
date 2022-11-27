import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DSBackButton extends StatelessWidget {
  const DSBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackButton(
      color: DSTheme.of(context).colorScheme.onSurface,
      onPressed: () => GoRouter.of(context).pop(),
    );
  }
}
