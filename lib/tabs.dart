import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meny_admin/src/presentation/locations/locations_page.dart';
import 'package:meny_admin/src/presentation/menus/menus_page.dart';
import 'package:meny_admin/src/presentation/store_hours/store_hours_page.dart';

typedef TabTypeDef = dartz.Tuple4<IconData, IconData, String, Widget>;
const tabs = <TabTypeDef>[
  TabTypeDef(
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.utensils,
    'Menus',
    MenusPage(),
  ),
  // TabTypeDef(
  //   FontAwesomeIcons.tableList,
  //   FontAwesomeIcons.tableList,
  //   'Orders',
  // ),
  TabTypeDef(
    FontAwesomeIcons.locationDot,
    FontAwesomeIcons.locationDot,
    'Locations',
    LocationsPage(),
  ),
  TabTypeDef(
    FontAwesomeIcons.businessTime,
    FontAwesomeIcons.businessTime,
    'Store Hours',
    StoreHoursPage(),
  ),
  // TabTypeDef(
  //   Icons.messenger_outline_outlined,
  //   Icons.messenger_outline,
  //   'Messaging',
  // ),
  // TabTypeDef(
  //   FontAwesomeIcons.users,
  //   FontAwesomeIcons.users,
  //   'Customers',
  // ),
  // if (kDebugMode) ...[
  //   TabTypeDef(
  //     FontAwesomeIcons.gear,
  //     FontAwesomeIcons.gear,
  //     'Developer',
  //   ),
  // ],
];
