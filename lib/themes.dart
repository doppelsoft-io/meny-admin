import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  const Themes._();

  static Color primaryColor = Colors.green;

  static TextTheme defaultTextTheme = _light.textTheme;
  static TextTheme textTheme =
      GoogleFonts.balooTextTheme(defaultTextTheme).copyWith(
    bodyText1: GoogleFonts.hind(textStyle: defaultTextTheme.bodyText1),
    bodyText2: GoogleFonts.hind(textStyle: defaultTextTheme.bodyText2),
    caption: GoogleFonts.hind(textStyle: defaultTextTheme.caption),
    overline: GoogleFonts.hind(textStyle: defaultTextTheme.overline),
  );

  static ColorScheme colorScheme = ColorScheme(
    primary: primaryColor,
    secondary: Colors.white,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: primaryColor,
    onBackground: Colors.grey[200]!,
    onError: Colors.white,
    brightness: Brightness.dark,
  );

  static final textFormFieldThemeData = DTextFormFieldThemeData.fallback();

  static final DTheme theme = DTheme(
    textTheme: textTheme,
    colorScheme: colorScheme,
    checkboxThemeData: DCheckboxThemeData.fallback().copyWith(
      contentPadding: EdgeInsets.zero,
      fillColor: MaterialStateProperty.all(primaryColor),
    ),
    textFormFieldThemeData: textFormFieldThemeData.copyWith(
      cursorColor: colorScheme.primary,
      errorColor: colorScheme.error,
      labelStyle: textTheme.bodyText1,
      border: textFormFieldThemeData.border!.copyWith(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      enabledBorder: textFormFieldThemeData.border!.copyWith(
        borderSide: BorderSide(
          color: Colors.grey[100]!,
        ),
      ),
      focusedBorder: textFormFieldThemeData.border!.copyWith(
        borderSide: BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
    ),
  );

  static final ThemeData _light = ThemeData.light();

  static BoxShadow boxShadow = BoxShadow(
    color: Colors.grey[100]!,
    offset: const Offset(0, 2),
    blurRadius: 4,
  );

  static TextStyle textStyle = GoogleFonts.baloo();
  static TextStyle secondaryTextStyle = GoogleFonts.hind();

  static TextTheme secondaryTextTheme =
      GoogleFonts.hindTextTheme(_light.textTheme);

  static ThemeData defaultTheme = _light.copyWith(
    colorScheme: colorScheme,
    // primaryColor: const Color.fromARGB(255, 48, 58, 48),
    primaryColor: primaryColor,
    backgroundColor: Colors.grey[100],
    indicatorColor: primaryColor,
    appBarTheme: _light.appBarTheme.copyWith(
      elevation: 1,
    ),
    listTileTheme: const ListTileThemeData(
      enableFeedback: true,
      contentPadding: EdgeInsets.zero,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(colorScheme.primary),
      checkColor: MaterialStateProperty.all(colorScheme.onPrimary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            );
          },
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: Colors.grey[300]!)),
        shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
    dataTableTheme: const DataTableThemeData(
      horizontalMargin: 5,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Colors.grey[100],
      selectedIconTheme: IconThemeData(
        size: 28,
        color: primaryColor,
      ),
      selectedLabelTextStyle: secondaryTextStyle.copyWith(
        color: primaryColor,
        fontWeight: FontWeight.w700,
      ),
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Colors.grey[700],
      ),
      unselectedLabelTextStyle: secondaryTextStyle.copyWith(
        color: Colors.grey[700],
        fontWeight: FontWeight.w700,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme,
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      labelStyle: secondaryTextStyle.copyWith(fontWeight: FontWeight.w700),
      labelPadding: const EdgeInsets.symmetric(horizontal: 25),
      unselectedLabelStyle:
          secondaryTextStyle.copyWith(fontWeight: FontWeight.w700),
    ),
  );
}
