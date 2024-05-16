import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 110, 150, 95),
  scaffoldBackgroundColor: const Color.fromARGB(255, 245, 255, 245),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromARGB(255, 110, 150, 95),
    onPrimary: const Color.fromARGB(255, 220, 227, 217),
    secondary: const Color.fromARGB(255, 205, 218, 201),
    background: const Color(0xffd2e6cd),
    surface: Colors.white,
    onBackground: Colors.black,
    outline: const Color.fromARGB(19, 145, 145, 145),
    outlineVariant: const Color.fromRGBO(0, 0, 0, 0.038),
    onPrimaryContainer: const Color(0xffc1c1c1),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: const Color.fromARGB(255, 110, 150, 95),
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 21,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: const Color.fromARGB(255, 110, 150, 95),
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w900,
    ),
    titleSmall: TextStyle(
      color: const Color.fromARGB(255, 110, 150, 95),
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: const Color.fromARGB(255, 205, 218, 201),
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
      color: const Color.fromARGB(255, 110, 150, 95),
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w900,
    ),
    displaySmall: TextStyle(
      color: const Color.fromARGB(255, 110, 150, 95),
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 14,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 21,
      fontWeight: FontWeight.w900,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: TextStyle(
      color: const Color(0xff737373),
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w900,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(const Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 110, 150, 95),
  ),
  hintColor: const Color.fromARGB(255, 205, 218, 201),
  dividerColor: const Color.fromARGB(36, 0, 0, 0),
  dividerTheme: const DividerThemeData(
    color: Color.fromARGB(36, 0, 0, 0),
  ),
);
