import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PageActionButton extends StatelessWidget {
  const PageActionButton({
    Key? key,
    required this.title,
    this.mobileTitle,
    this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String? mobileTitle;
  final IconData? iconData;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      tablet: ElevatedButton.icon(
        label: Text(mobileTitle ?? title),
        icon: Icon(iconData ?? Icons.add),
        onPressed: onPressed,
        style: const ButtonStyle(
          visualDensity: VisualDensity.comfortable,
        ),
      ),
      mobile: ElevatedButton.icon(
        label: Text(mobileTitle ?? title),
        icon: Icon(iconData ?? Icons.add),
        onPressed: onPressed,
        style: const ButtonStyle(
          visualDensity: VisualDensity.compact,
        ),
      ),
      desktop: ElevatedButton.icon(
        label: Text(title),
        icon: Icon(iconData ?? Icons.add),
        onPressed: onPressed,
        style: const ButtonStyle(
          visualDensity: VisualDensity.standard,
        ),
      ),
    );
  }
}
