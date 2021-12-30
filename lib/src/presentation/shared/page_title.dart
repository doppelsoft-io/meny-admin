import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
      desktop: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
