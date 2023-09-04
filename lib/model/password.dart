import 'package:hive/hive.dart';
part 'password.g.dart';

@HiveType(typeId: 1)
class PasswordModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String time;

  PasswordModel({required this.password, required this.time, this.id});
}
