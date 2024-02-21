import 'package:flutter/material.dart';
class appTheme {
  static Color primaryLight=Color(0xffB7935F);
  static Color primaryDark=Color(0xff141A2E);
  static Color black=Color(0xff242424);
  static Color white=Color(0xffF8F8F8);
  static Color gold=Color(0xffFACC1D);
  static ThemeData  lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: black,
      backgroundColor: primaryLight,
      unselectedItemColor: white,
    ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: black
        )
      ),
      textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: black
      ),
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: black
        ),
        bodyLarge:  TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: black
        ),


      )
  );
  static ThemeData  darkTheme=ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primaryDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: gold,
        backgroundColor: primaryDark,
        unselectedItemColor: white,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: white
          )
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: white
        ),
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: gold
        ),
        bodyLarge:  TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: gold
        ),
      )
  );
}