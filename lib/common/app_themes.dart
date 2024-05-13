


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  primaryColor:const Color.fromARGB(255,110, 150, 95),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromARGB(255,110, 150, 95),
    onPrimary: const Color.fromARGB(255, 220, 227, 217),
    background: Colors.green,
    surface: const Color.fromARGB(255, 246, 247, 251),
    onBackground: Colors.black,
    outline: Colors.black12,
  ),

  primaryTextTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
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
  snackBarTheme: SnackBarThemeData(
    showCloseIcon: true,
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    contentTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    insetPadding: const EdgeInsets.all(10),
    closeIconColor: Colors.black38,
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
  buttonColor:  Color.fromARGB(255,110, 150, 95), 
 ),
  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(
      color: Colors.black45,
    ),
  ),

  dividerColor: Colors.black12,
  dividerTheme: const DividerThemeData(
    color: Colors.black12,
  ),
  textTheme: GoogleFonts.dmSansTextTheme(),
  // Add more theme properties as needed
);
