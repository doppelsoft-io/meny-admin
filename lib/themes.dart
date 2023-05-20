import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

const primaryColor = Colors.black;
// const primaryColor = Color(0xff39aa11);
final effectiveTheme = DSThemeData(
  primaryTextTheme: GoogleFonts.baloo2TextTheme(),
  primaryTextStyle: GoogleFonts.baloo2(),
  colorScheme: const ColorScheme(
    primary: primaryColor,
    onPrimary: whiteColor,
    secondary: whiteColor,
    onSecondary: primaryColor,
    surface: whiteColor,
    onSurface: whiteColor,
    background: whiteColor,
    onBackground: whiteColor,
    error: Colors.red,
    onError: whiteColor,
    brightness: Brightness.light,
  ),
  checkboxThemeData: DSCheckboxThemeData.fallback().copyWith(
    fillColor: MaterialStateProperty.all(blackColor),
    checkColor: MaterialStateProperty.all(whiteColor),
  ),
  tabThemeData: const DSTabThemeData(
    height: 48,
  ),
);
