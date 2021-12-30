import 'package:flutter/material.dart';
import 'package:meny/src/constants/spacing.dart';
import 'package:meny/src/presentation/shared/shared.dart';

class MenusPagePersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Function() onNewPressed;

  const MenusPagePersistentHeaderDelegate({
    required this.title,
    required this.onNewPressed,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: PageTitle(title: title),
          titleSpacing: Spacing.pageSpacing,
          actions: [
            Center(
              child: PageActionButton(
                title: 'New',
                onPressed: onNewPressed,
              ),
            ),
            const SizedBox(width: Spacing.pageSpacing),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
