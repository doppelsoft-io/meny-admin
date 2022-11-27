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
              theme: const DSTextThemeData.b1(),
            ),
            if (caption != null) ...[
              DSHorizontalSpacing.smallest(),
              DSText(
                caption!,
                theme: const DSTextThemeData.c2(),
              ),
            ],
            if (onInfoTapped != null) ...[
              DSHorizontalSpacing.smallest(),
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
        if (subtitle != null) ...[
          DSVerticalSpacing.smallest(),
          DSText(
            subtitle!,
            theme: const DSTextThemeData.b5(),
          ),
        ],
        DSVerticalSpacing.smallest(),
        child,
        DSVerticalSpacing.large(),
      ],
    );
  }
}
