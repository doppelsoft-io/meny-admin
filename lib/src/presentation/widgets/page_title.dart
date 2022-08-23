import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: DSText(
        title,
        theme: DSTextThemeData.titleLarge(),
      ),
    );
  }
}
