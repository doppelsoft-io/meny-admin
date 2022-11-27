import 'package:doppelsoft_core/doppelsoft_core.dart' show Tuple4;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meny_admin/src/presentation/presentation.dart';

typedef TabTypeDef = Tuple4<IconData, IconData, String, Widget>;
const tabs = <TabTypeDef>[
  TabTypeDef(
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.utensils,
    'Menus',
    MenusScreen(),
  ),
  TabTypeDef(
    FontAwesomeIcons.store,
    FontAwesomeIcons.store,
    'Store',
    MyStoreScreen(),
  ),
];
