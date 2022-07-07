import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meny_admin/src/presentation/menus/views/menus_screen.dart';

import 'package:meny_admin/src/presentation/my_store/my_store.dart';

typedef TabTypeDef = dartz.Tuple4<IconData, IconData, String, Widget>;
const tabs = <TabTypeDef>[
  TabTypeDef(
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.utensils,
    'Menu',
    MenusScreen(),
  ),
  TabTypeDef(
    FontAwesomeIcons.store,
    FontAwesomeIcons.store,
    'Store',
    MyStoreScreen(),
  ),
];
