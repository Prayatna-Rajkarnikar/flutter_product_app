import 'package:flutter/material.dart';
import 'package:product_app/utils/custom_themes/appbar_theme.dart';
import 'package:product_app/utils/custom_themes/card_theme.dart';
import 'package:product_app/utils/custom_themes/elevated_button_theme.dart';
import 'package:product_app/utils/custom_themes/searchbar_theme.dart';
import 'package:product_app/utils/custom_themes/text_theme.dart';

class MyTheme {
  MyTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple[400],
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: MyAppbarTheme.lightAppbarTheme,
    cardTheme: MyCardTheme.lightCardTheme,
    inputDecorationTheme: MySearchBarTheme.lightSearchBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple[400],
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: MyAppbarTheme.darkAppbarTheme,
    cardTheme: MyCardTheme.darkCardTheme,
    inputDecorationTheme: MySearchBarTheme.darkSearchBarTheme,
  );
}
