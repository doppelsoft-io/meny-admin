import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class ResourceTableHeader extends StatelessWidget {
  const ResourceTableHeader({
    super.key,
    this.color = whiteColor,
    this.height = 65,
    this.padding = const EdgeInsets.symmetric(
      horizontal: DSSpacing.sm,
      vertical: DSSpacing.xs,
    ),
    required this.title,
    this.toolbar,
    this.showToolbar = false,
    this.actions,
  });

  final Color color;
  final double height;
  final EdgeInsets padding;
  final String title;
  final Widget? toolbar;
  final bool showToolbar;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: toolbar != null && showToolbar,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: const DSBorderSideThemeData(
                color: grey100Color,
                width: 1,
              ).toBorderSide,
            ),
          ),
          height: getValueForScreenType(
            context: context,
            mobile: height,
          ),
          padding: EdgeInsets.only(
            // left: toolbar != null && showToolbar ? 0 : padding.left,
            left: padding.left,
            right: padding.right,
            top: padding.top,
            bottom: padding.bottom,
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    PageTitle(title: title),
                    if (toolbar != null && showToolbar) ...[
                      DSHorizontalSpacing.small(),
                      const VerticalDivider(width: 0),
                      DSHorizontalSpacing.smallest(),
                      Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: toolbar,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              const Spacer(),
              if (actions != null && actions!.isNotEmpty) ...[
                ...actions!.map((e) => e).toList()
              ]
            ],
          ),
        ),
      ),
    );
  }
}
