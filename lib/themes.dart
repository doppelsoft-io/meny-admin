import 'package:doppelsoft_ui/doppelsoft_ui.dart';
import 'package:flutter/material.dart';

const primaryColor = Colors.green;
final effectiveTheme = DSThemeData(
  primaryTextTheme: GoogleFonts.baloo2TextTheme(),
  primaryTextStyle: GoogleFonts.baloo2(),
  colorScheme: const ColorScheme(
    primary: primaryColor,
    secondary: whiteColor,
    surface: whiteColor,
    background: whiteColor,
    error: Colors.red,
    onPrimary: whiteColor,
    onSecondary: whiteColor,
    onSurface: blackColor,
    onBackground: grey200Color,
    onError: whiteColor,
    brightness: Brightness.light,
  ),
  checkboxThemeData: DSCheckboxThemeData.fallback().copyWith(
    fillColor: MaterialStateProperty.all(primaryColor),
    checkColor: MaterialStateProperty.all(whiteColor),
  ),
  radioThemeData: DSRadioThemeData.fallback().copyWith(
    fillColor: primaryColor,
  ),
);
