import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:password_genarator/model/password.dart';

class DatabaseFuctions extends GetxController {
  RxList<PasswordModel> passwordHistory = <PasswordModel>[].obs;
  Future addPassword(PasswordModel data) async {
    final passwordBox = await Hive.openBox<PasswordModel>('password_database');
    final id = await passwordBox.add(data);
    data.id = id;
    final value =
        PasswordModel(password: data.password, time: data.time, id: id);
    passwordBox.put(id, value);
    passwordHistory.add(data);
    update();
  }

  Future getAllPassword() async {
    final passwordBox = await Hive.openBox<PasswordModel>('password_database');
    passwordHistory.clear();
    passwordHistory.addAll(passwordBox.values);
    update();
  }

  Future clearAllPasswords() async {
    final passwordBox = await Hive.openBox<PasswordModel>('password_database');
    await passwordBox.clear();
    await getAllPassword();
  }

  Future deletePassword(int id) async {
    final passwordBox = await Hive.openBox<PasswordModel>('password_database');
    passwordBox.delete(id);
    getAllPassword();
    update();
  }
}
