import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    subtitle1: GoogleFonts.openSans(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 20.0,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.teal,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  // 3
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
              (states) {
            return const Color.fromRGBO(0,104,140,1);
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(133, 78, 155, 1),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(133, 78, 155, 1),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromRGBO(133, 78, 155, 1),
      ),
      textTheme: lightTextTheme,
    );
  }

  // Color.fromRGBO(0,118,223,1), blue
  // Color.fromRGBO(95,162,186,1), light blue
  // Color.fromRGBO(102,102,102,1), grey dark
  // Color.fromRGBO(133,78,155,1),  purple dark
  // Color.fromRGBO(202,88,157,1), purple light
  // Color.fromRGBO(175,186,197,1), grey light
  // Color.fromRGBO(0,104,140,1), teal

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }
}