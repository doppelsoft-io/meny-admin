import 'package:doppelsoft_core/doppelsoft_core.dart';
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
            DText.subtitle1(title),
            if (caption != null) ...[
              const SizedBox(width: 5),
              DText.caption(caption!),
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
        if (subtitle != null) DText.caption(subtitle!),
        VerticalSpacing.smallest(),
        child,
        VerticalSpacing.large(),
      ],
    );
  }
}
