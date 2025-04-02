import 'package:flutter/material.dart';

class MyCardTheme {
  MyCardTheme._();

  static final lightCardTheme = CardTheme(
    color: Colors.white,
    shadowColor: Color.fromRGBO(158, 158, 158, 0.2),
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: EdgeInsets.all(8),
  );

  static final darkCardTheme = CardTheme(
    color: Colors.grey[900],
    shadowColor: Color.fromRGBO(0, 0, 0, 0.5),
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: EdgeInsets.all(8),
  );
}
