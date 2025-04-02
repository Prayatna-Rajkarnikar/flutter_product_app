import 'package:flutter/material.dart';

class MySearchBarTheme {
  MySearchBarTheme._();

  static InputDecorationTheme lightSearchBarTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.grey[600]),
    prefixIconColor: Colors.grey,
  );

  static InputDecorationTheme darkSearchBarTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[900],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.grey[400]),
    prefixIconColor: Colors.grey[400],
  );
}
