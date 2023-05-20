import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';

class TabScreenArgs {
  TabScreenArgs({
    required this.child,
    required this.tabs,
    required this.initialTabIndex,
  });

  final Widget child;
  final List<DSTabModel> tabs;
  final int initialTabIndex;
}
