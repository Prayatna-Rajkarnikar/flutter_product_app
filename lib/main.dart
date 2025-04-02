import 'package:flutter/material.dart';
import 'package:product_app/screens/product_list_screen.dart';
import 'package:product_app/utils/theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
    ),
  );
}
