import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/presentation/shared/shared.dart';

class MenusPagePersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const MenusPagePersistentHeaderDelegate({
    required this.title,
    required this.onNewPressed,
  });

  final String title;
  final Function() onNewPressed;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: Spacing.pageSpacing),
      height: maxExtent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageTitle(title: title),
              Center(
                child: PageActionButton(
                  title: 'New',
                  onPressed: onNewPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 64;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
