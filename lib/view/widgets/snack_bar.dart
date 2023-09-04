import 'package:flutter/material.dart';

class CommonSnackBar {
  static snackBar(
      {required String title, required Color clr, required context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Center(child: Text(title)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: clr,
    ));
  }
}
