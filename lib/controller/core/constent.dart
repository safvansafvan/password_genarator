import 'package:flutter/material.dart';

class CustomClr {
  static Color kwhite = Colors.white;
  static Color kblack = Colors.black;
}

class CustomFuc {
  static TextStyle textStyleFuc(
      {required FontWeight fontWeight,
      required Color color,
      required double size}) {
    return TextStyle(fontWeight: fontWeight, color: color, fontSize: size);
  }
}
