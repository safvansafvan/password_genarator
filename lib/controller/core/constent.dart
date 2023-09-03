import 'package:flutter/material.dart';

class CustomClr {
  static Color kwhite = Colors.white;
  static Color kblack = Colors.black;
  static Color kred = Colors.red;
  static Color kgreen = Colors.green;
}

class CustomFuc {
  static TextStyle textStyleFuc(
      {required FontWeight fontWeight,
      required Color color,
      required double size}) {
    return TextStyle(fontWeight: fontWeight, color: color, fontSize: size);
  }
}

class CustomHeight {
  static var commonHeight = const SizedBox(
    height: 20,
  );
}
