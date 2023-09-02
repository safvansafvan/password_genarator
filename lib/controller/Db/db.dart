import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:password_genarator/model/password.dart';

class DatabaseFuctions extends ChangeNotifier {
  List<PasswordModel> passwordHistory = [];
  Future addPassword(PasswordModel data) async {
    final passwordBox = await Hive.openBox<PasswordModel>('password_database');
    final id = await passwordBox.add(data);
    data.id = id;
    final value =
        PasswordModel(password: data.password, time: data.time, id: id);
    passwordBox.put(id, value);
    passwordHistory.add(data);
    notifyListeners();
  }

  Future getAllPassword() async {
    final passwordBox = await Hive.openBox<PasswordModel>('password_database');
    passwordHistory.clear();
    passwordHistory.addAll(passwordBox.values);
    notifyListeners();
  }
}
