import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef TabTypeDef = dartz.Tuple3<IconData, IconData, String>;
const tabs = <TabTypeDef>[
  TabTypeDef(
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.utensils,
    'Menus',
  ),
  TabTypeDef(
    FontAwesomeIcons.tableList,
    FontAwesomeIcons.tableList,
    'Orders',
  ),
  TabTypeDef(
    FontAwesomeIcons.locationDot,
    FontAwesomeIcons.locationDot,
    'Locations',
  ),
  TabTypeDef(
    FontAwesomeIcons.businessTime,
    FontAwesomeIcons.businessTime,
    'Store Hours',
  ),
  // TabTypeDef(
  //   Icons.messenger_outline_outlined,
  //   Icons.messenger_outline,
  //   'Messaging',
  // ),
  TabTypeDef(
    FontAwesomeIcons.users,
    FontAwesomeIcons.users,
    'Customers',
  ),
  if (kDebugMode) ...[
    TabTypeDef(
      FontAwesomeIcons.gear,
      FontAwesomeIcons.gear,
      'Developer',
    ),
  ],
];
