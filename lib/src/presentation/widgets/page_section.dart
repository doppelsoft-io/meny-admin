import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageSection extends StatelessWidget {
  const PageSection({
    Key? key,
    required this.title,
    required this.child,
    this.subtitle,
    this.caption,
    this.onInfoTapped,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String? caption;
  final Widget child;
  final Function(BuildContext)? onInfoTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DSText(
              title,
              theme: DSTextThemeData.titleMedium(),
            ),
            if (caption != null) ...[
              const SizedBox(width: 5),
              DSText(
                caption!,
                theme: DSTextThemeData.bodySmall(),
              ),
            ],
            if (onInfoTapped != null) ...[
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () => onInfoTapped!(context),
                child: const Icon(
                  FontAwesomeIcons.circleInfo,
                  size: 16,
                ),
              ),
            ]
          ],
        ),
        if (subtitle != null)
          DSText(
            subtitle!,
            theme: DSTextThemeData.bodySmall(),
          ),
        DSVerticalSpacing.smallest(),
        child,
        DSVerticalSpacing.large(),
      ],
    );
  }
}
