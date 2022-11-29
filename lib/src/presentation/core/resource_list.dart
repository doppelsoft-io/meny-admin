import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  _HeaderDelegate({
    required this.title,
    required this.action,
  });

  final String title;
  final Widget action;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ResourceTableHeader(
      title: title,
      actions: [action],
    );
  }

  @override
  double get maxExtent => 85;

  @override
  double get minExtent => 85;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class ResourceList<T> extends StatelessWidget {
  const ResourceList({
    Key? key,
    required this.title,
    required this.action,
    required this.resources,
    required this.itemBuilder,
    required this.emptyMessage,
    this.sortColumnIndex,
    this.sortAscending = true,
  }) : super(key: key);

  final String title;
  final Widget action;
  final List<T> resources;
  final Widget Function(BuildContext, T) itemBuilder;
  final String emptyMessage;
  final int? sortColumnIndex;
  final bool sortAscending;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, scrolled) {
        return [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _HeaderDelegate(
              title: title,
              action: action,
            ),
          ),
        ];
      },
      body: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (_, i) {
          if (resources.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(DSSpacing.sm),
              child: DSText(emptyMessage),
            );
          }
          final resource = resources[i];
          return itemBuilder(_, resource);
        },
        separatorBuilder: (_, i) {
          return const Divider(height: 0);
        },
        itemCount: resources.isEmpty ? 1 : resources.length,
      ),
    );
  }
}
