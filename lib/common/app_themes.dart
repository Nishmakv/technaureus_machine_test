import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 110, 150, 95),
  scaffoldBackgroundColor: Color.fromARGB(255, 245, 255, 245),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromARGB(255, 110, 150, 95),
    onPrimary: const Color.fromARGB(255, 220, 227, 217),
   background: Color(0xffd2e6cd),
    surface: Colors.white,
    onBackground: Colors.black,
    outline: Colors.black12,
  ),

  primaryTextTheme: TextTheme(
    titleLarge: TextStyle(
      color: const Color.fromARGB(255, 110, 150, 95),
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),

  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(const Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
  cardTheme: CardTheme(
    surfaceTintColor: Colors.white,
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 110, 150, 95),
  ),
 
 
  textTheme: GoogleFonts.dmSansTextTheme(),

  hintColor: Color.fromARGB(255, 205, 218, 201),
  // Add more theme properties as needed
);
