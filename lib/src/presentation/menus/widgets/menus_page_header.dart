import 'package:flutter/material.dart';
import 'package:meny/src/presentation/shared/page_action_button.dart';
import 'package:meny/src/presentation/shared/page_title.dart';

class MenusPageHeader extends StatelessWidget {
  final String humanReadableResourceName;
  final Function() onNewPressed;

  const MenusPageHeader({
    Key? key,
    required this.humanReadableResourceName,
    required this.onNewPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PageTitle(title: humanReadableResourceName),
        PageActionButton(
          title: 'New',
          onPressed: onNewPressed,
        ),
      ],
    );
  }
}
