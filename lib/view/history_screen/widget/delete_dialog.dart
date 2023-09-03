import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_genarator/controller/getx/db.dart';

class DeleteDialog {
  static void deleteDialog(context) {
    final dbController = Get.put(DatabaseFuctions());
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Delete"),
              content: const Text("Are you sure . It is delete all passwords"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await dbController.deletePassword();
                    },
                    child: const Text("Ok"))
              ],
            ));
  }
}
