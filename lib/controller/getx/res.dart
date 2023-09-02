import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  TextEditingController passwordController = TextEditingController();
  RxBool numbers = false.obs;
  RxBool charector = false.obs;
  RxBool specialChar = false.obs;
  RxInt sliderValue = 6.obs;

  void numbersONorOff(bool numbersField) {
    numbers.value = numbersField;
    update();
  }

  void charectorsOnorOff(bool charectorField) {
    charector.value = charectorField;
    update();
  }

  void specialCharectorOnorOff(bool specialCharField) {
    specialChar.value = specialCharField;
    update();
  }

  void sliderUpdates(double value) {
    sliderValue.value = value.toInt();
    update();
  }

  String genaratePassword(
      {required int length,
      bool numbers = true,
      bool letters = true,
      bool specialCharec = true}) {
    String chars = '';
    const letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
    const letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const number = '0123456789';
    const special = '@#%^*>\$@?/[]=+';

    if (numbers) chars += number;
    if (letters) chars += '$letterLowerCase $letterUpperCase';
    if (specialCharec) chars += special;
    return List.generate(length, (index) {
      final indexRadom = Random.secure().nextInt(chars.length);
      return chars[indexRadom];
    }).join('');
  }
}
