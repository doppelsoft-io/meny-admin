import 'package:doppelsoft_core/doppelsoft_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  const Themes._();

  static Color primaryColor = Colors.green.shade400;

  static TextTheme defaultTextTheme = _light.textTheme;
  static TextTheme textTheme = GoogleFonts.balooTextTheme().copyWith(
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
      iconColor: Colors.black,
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
        visualDensity: VisualDensity.standard,
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
        visualDensity: VisualDensity.standard,
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
      backgroundColor: Colors.white,
      indicatorColor: Colors.white,
      selectedIconTheme: IconThemeData(
        size: 16,
        color: primaryColor,
      ),
      selectedLabelTextStyle: textTheme.headline5!.copyWith(
        color: primaryColor,
        fontSize: 16,
      ),
      unselectedIconTheme: IconThemeData(
        size: 16,
        color: Colors.grey[700],
      ),
      unselectedLabelTextStyle: textTheme.headline5!.copyWith(
        color: Colors.grey[700],
        fontSize: 16,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        size: 16,
        color: primaryColor,
      ),
      selectedItemColor: primaryColor,
      selectedLabelStyle: textTheme.headline5!.copyWith(
        color: primaryColor,
        fontSize: 16,
      ),
      unselectedIconTheme: IconThemeData(
        size: 16,
        color: Colors.grey[700],
      ),
      unselectedLabelStyle: textTheme.headline5!.copyWith(
        color: Colors.grey[700],
        fontSize: 16,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(primaryColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(Colors.grey.shade200),
      thumbColor: MaterialStateProperty.all(primaryColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
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
