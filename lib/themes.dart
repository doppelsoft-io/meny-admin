import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  const Themes._();

  static final ThemeData _light = ThemeData.light();

  static Color primaryColor = Colors.green;

  static TextTheme defaultTextTheme = _light.textTheme;
  static TextTheme textTheme =
      GoogleFonts.balooTextTheme(defaultTextTheme).copyWith(
    bodyText1: GoogleFonts.hind(textStyle: defaultTextTheme.bodyText1),
    bodyText2: GoogleFonts.hind(textStyle: defaultTextTheme.bodyText2),
    caption: GoogleFonts.hind(textStyle: defaultTextTheme.caption),
    overline: GoogleFonts.hind(textStyle: defaultTextTheme.overline),
    // button: GoogleFonts.hind(textStyle: defaultTextTheme.button),
  );

  static BoxShadow boxShadow = BoxShadow(
    color: Colors.grey[100]!,
    offset: const Offset(0, 2),
    blurRadius: 4.0,
  );

  static TextStyle textStyle = GoogleFonts.baloo();
  static TextStyle secondaryTextStyle = GoogleFonts.hind();

  static TextTheme secondaryTextTheme =
      GoogleFonts.hindTextTheme(_light.textTheme);

  static ThemeData defaultTheme = _light.copyWith(
    colorScheme: ColorScheme(
      primary: primaryColor,
      primaryVariant: Colors.greenAccent,
      secondary: Colors.white,
      secondaryVariant: Colors.white,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: primaryColor,
      onBackground: Colors.white,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
    primaryColor: Colors.green,
    backgroundColor: Colors.grey[100],
    indicatorColor: primaryColor,
    // dialogTheme: DialogTheme(
    //   contentTextStyle: TextStyle(
    //     color: Colors.black,
    //   ),
    //   titleTextStyle: TextStyle(
    //     color: Colors.black,
    //   ),
    // ),
    appBarTheme: _light.appBarTheme.copyWith(
      elevation: 1,
    ),
    // bottomAppBarColor: Colors.red,
    // bottomAppBarTheme: BottomAppBarTheme(
    //   color: Colors.red,
    // ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      alignLabelWithHint: false,
      hintStyle: textTheme.bodyText1,
      labelStyle: textTheme.bodyText1!.copyWith(color: Colors.grey[800]),
      helperStyle: textTheme.bodyText1,
      suffixStyle: textTheme.bodyText1,
      counterStyle: textTheme.bodyText1,
      errorStyle: textTheme.bodyText1,
      prefixStyle: textTheme.bodyText1,
      fillColor: Colors.grey[100],
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey[100]!,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey[200]!,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey[200]!,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey[200]!,
        ),
      ),
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
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //     textStyle: TextStyle(color: Colors.black),
    //   ),
    // ),
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
    // dividerTheme: DividerThemeData(
    //   color: Colors.grey[200],
    //   space: 30,
    //   thickness: 2,
    // ),
    dataTableTheme: const DataTableThemeData(
      horizontalMargin: 5,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Colors.grey[100],
      selectedIconTheme: IconThemeData(
        size: 28.0,
        color: primaryColor,
      ),
      selectedLabelTextStyle: secondaryTextStyle.copyWith(
        color: primaryColor,
        fontWeight: FontWeight.w700,
      ),
      unselectedIconTheme: IconThemeData(
        size: 28.0,
        color: Colors.grey[700],
      ),
      unselectedLabelTextStyle: secondaryTextStyle.copyWith(
        color: Colors.grey[700],
        fontWeight: FontWeight.w700,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   unselectedItemColor: Colors.green[100],
    //   selectedItemColor: Colors.white,
    //   backgroundColor: Colors.green,
    //   unselectedLabelStyle: TextStyle(fontSize: 10.0),
    //   selectedLabelStyle: TextStyle(fontSize: 12.0),
    //   showUnselectedLabels: true,
    //   type: BottomNavigationBarType.fixed,
    // ),
    textTheme: textTheme,
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      labelStyle: secondaryTextStyle.copyWith(fontWeight: FontWeight.w700),
      labelPadding: const EdgeInsets.symmetric(horizontal: 25),
      // unselectedLabelColor: Colors.grey[600],
      unselectedLabelStyle:
          secondaryTextStyle.copyWith(fontWeight: FontWeight.w700),
    ),
  );
}
