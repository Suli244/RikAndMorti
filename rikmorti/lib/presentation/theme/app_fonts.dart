import 'package:flutter/material.dart';
abstract class AppFonts {
  static const TextStyle textAppearanceBody1 = TextStyle(
    color: Color(0xFF5B6975),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle roboto = TextStyle(
    color: Color(0xFF5B6975),
    fontSize: 15,
    letterSpacing: 1.50,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textAppearanceOverline = TextStyle(
    color:Color(0xFF42D048),
    fontSize: 10,
    height: 1.50,
    letterSpacing: 0.50,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle robotoName = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    height: 1.50,
    letterSpacing: 0.50,
  );
  static const TextStyle textAppearanceCaption = TextStyle(
    color: Color(0xFF6E798C),
    fontSize: 12,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.50,
  );
}
