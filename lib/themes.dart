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
    blurRadius: 4,
  );

  static TextStyle textStyle = GoogleFonts.baloo();
  static TextStyle secondaryTextStyle = GoogleFonts.hind();

  static TextTheme secondaryTextTheme =
      GoogleFonts.hindTextTheme(_light.textTheme);

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

  static ThemeData defaultTheme = _light.copyWith(
    colorScheme: colorScheme,
    primaryColor: const Color.fromARGB(255, 48, 58, 48),
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
    // inputDecorationTheme: InputDecorationTheme(
    //   floatingLabelBehavior: FloatingLabelBehavior.always,
    //   hintStyle: textTheme.bodyText1,
    //   labelStyle: textTheme.bodyText1!.copyWith(color: Colors.grey[800]),
    //   helperStyle: textTheme.bodyText1,
    //   suffixStyle: textTheme.bodyText1,
    //   counterStyle: textTheme.bodyText1,
    //   errorStyle: textTheme.bodyText1,
    //   prefixStyle: textTheme.bodyText1,
    //   fillColor: Colors.grey[100],
    //   filled: true,
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.zero,
    //     borderSide: BorderSide(
    //       width: 2,
    //       color: Colors.grey[100]!,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.zero,
    //     borderSide: BorderSide(
    //       width: 2,
    //       color: primaryColor,
    //     ),
    //   ),
    //   disabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.zero,
    //     borderSide: BorderSide(
    //       width: 2,
    //       color: Colors.grey[200]!,
    //     ),
    //   ),
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.zero,
    //     borderSide: BorderSide(
    //       width: 2,
    //       color: Colors.grey[200]!,
    //     ),
    //   ),
    // ),
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
