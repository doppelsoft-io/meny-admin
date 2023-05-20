import 'package:doppelsoft_core/doppelsoft_core.dart' show DSTabModel, Tuple4;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef TabTypeDef = Tuple4<IconData, IconData, String, String>;
final tabs = <DSTabModel>[
  DSTabModel(
    activeIcon: FontAwesomeIcons.utensils,
    label: 'Dashboard',
    routePath: '/d',
  ),
  DSTabModel(
    activeIcon: FontAwesomeIcons.store,
    label: 'Store',
    routePath: '/store',
  ),
];
