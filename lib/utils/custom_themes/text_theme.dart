import 'package:flutter/material.dart';

class MyTextTheme {
  MyTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.deepPurple[400],
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.deepPurple[400],
    ),
  );
}
