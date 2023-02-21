import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/locator.dart';
import 'package:meny_admin/navigator.dart';
import 'package:meny_admin/themes.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MenuPreviewHeaderDelegate extends SliverPersistentHeaderDelegate {
  const MenuPreviewHeaderDelegate({
    required this.title,
    required this.publishing,
    required this.onPublish,
  });

  final String title;
  final bool publishing;
  final Function() onPublish;

  @override
  double get maxExtent => 140;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: maxExtent,
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Container(
        padding: const EdgeInsets.all(DSSpacing.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            BackButton(
              onPressed: () {
                Locator.instance<NavigatorHelper>().goHome();
              },
            ),
            const SizedBox(width: DSSpacing.sm),
            QrImage(
              data: 'https://google.com',
              size: 74,
              padding: EdgeInsets.zero,
            ),
            const SizedBox(width: DSSpacing.xs),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: DSSpacing.xxs),
                  child: DSText(
                    title,
                    theme: const DSTextThemeData.d3(),
                  ),
                ),
                DSButton(
                  theme: DSButtonThemeData.text(
                    foregroundColor: effectiveTheme.colorScheme.primary,
                    textTheme: const DSTextThemeData.c1(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                    size: 20,
                  ),
                  text: 'View Online',
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: DSButton(
                    onPressed: publishing ? null : onPublish,
                    text: 'Publish',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
