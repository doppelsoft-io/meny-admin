import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageActionButton extends StatelessWidget {
  final String title;
  final String? mobileTitle;
  final Function() onPressed;

  const PageActionButton({
    Key? key,
    required this.title,
    this.mobileTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      tablet: ElevatedButton.icon(
        label: Text(mobileTitle ?? title),
        icon: const Icon(Icons.add),
        onPressed: onPressed,
        style: const ButtonStyle(
          visualDensity: VisualDensity.comfortable,
        ),
      ),
      mobile: ElevatedButton.icon(
        label: Text(mobileTitle ?? title),
        icon: const Icon(Icons.add),
        onPressed: onPressed,
        style: const ButtonStyle(
          visualDensity: VisualDensity.compact,
        ),
      ),
      desktop: ElevatedButton.icon(
        label: Text(title),
        icon: const Icon(Icons.add),
        onPressed: onPressed,
        style: const ButtonStyle(
          visualDensity: VisualDensity.standard,
        ),
      ),
    );
  }
}
