import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      desktop: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
