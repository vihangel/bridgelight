import 'package:flutter/material.dart';

///Tint & shade Generator https://maketintsandshades.com/#19191B
///On Figma primary is normal color not primary color
const MaterialColor primary = MaterialColor(
  0xFF19191b,
  <int, Color>{
    50: Color(0xFF303032),
    100: Color(0xFF474749),
    200: Color(0xFF5e5e5f),
    300: Color(0xFF757576),
    400: Color(0xFF8c8c8d),
    500: Color(0xFFa3a3a4),
    600: Color(0xFFbababb),
    700: Color(0xFFd1d1d1),
    800: Color(0xFFe8e8e8),
    900: Color(0xFFffffff),
  },
);

class MyBookStoreColors {
  static const Color normal = Color(0xFF19191B);
  static const Color subtitleDark = Color(0xFF61646B);
  static const Color subtitleLight = Color(0xFFAFB1B6);
  static const Color background = Color(0xFFEFEFF0);
  static const Color surface = Color(0xFFFAFAFA);
  static const Color primarySubtitle = Color(0xFFF7F5FF);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color.fromRGBO(0, 0, 0, 0.5);
}
