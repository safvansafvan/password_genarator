// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/controller/getx/db.dart';
import 'package:password_genarator/view/widgets/snack_bar.dart';

class DeleteDialog {
  static Future deleteDialog(context) async {
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
                      await dbController.clearAllPasswords();
                      Navigator.pop(context);
                      CommonSnackBar.snackBar(
                          title: "Deleted All Paswords",
                          clr: CustomClr.kred,
                          context: context);
                    },
                    child: const Text("Ok")),
              ],
            ));
  }
}
