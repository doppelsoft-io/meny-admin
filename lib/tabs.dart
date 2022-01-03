import 'package:dartz/dartz.dart' as dartz;
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
    FontAwesomeIcons.thList,
    FontAwesomeIcons.thList,
    'Orders',
  ),
  TabTypeDef(
    FontAwesomeIcons.mapMarkerAlt,
    FontAwesomeIcons.mapMarkerAlt,
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
];
