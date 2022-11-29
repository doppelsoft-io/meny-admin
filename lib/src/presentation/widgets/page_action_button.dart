import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

class PageActionButton extends StatelessWidget {
  const PageActionButton({
    Key? key,
    required this.title,
    this.mobileTitle,
    this.iconData,
    required this.onPressed,
    this.isDisabled = false,
  }) : super(key: key);

  final String title;
  final String? mobileTitle;
  final IconData? iconData;
  final VoidCallback onPressed;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      tablet: DSButton(
        icon: Icon(iconData ?? Icons.add),
        onPressed: isDisabled ? null : onPressed,
        text: mobileTitle ?? title,
      ),
      mobile: DSButton(
        icon: Icon(iconData ?? Icons.add),
        onPressed: isDisabled ? null : onPressed,
        text: mobileTitle ?? title,
      ),
      desktop: DSButton(
        icon: Icon(iconData ?? Icons.add),
        onPressed: isDisabled ? null : onPressed,
        text: title,
      ),
    );
  }
}
