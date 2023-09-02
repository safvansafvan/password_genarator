import 'package:get/get.dart';

class Controller extends GetxController {
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
}
