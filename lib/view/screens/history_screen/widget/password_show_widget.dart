import 'package:flutter/material.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/controller/getx/db.dart';
import 'package:password_genarator/model/password.dart';
import 'package:password_genarator/view/widgets/snack_bar.dart';

class PasswordShowingWidget extends StatelessWidget {
  const PasswordShowingWidget(
      {super.key,
      required this.screenHeight,
      required this.password,
      required this.dbController,
      required this.index});

  final double screenHeight;
  final PasswordModel password;
  final DatabaseFuctions dbController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight * 0.15,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                password.password,
                style: CustomFuc.textStyleFuc(
                  fontWeight: FontWeight.w500,
                  color: CustomClr.kwhite,
                  size: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    password.time,
                    style: CustomFuc.textStyleFuc(
                        fontWeight: FontWeight.w500,
                        color: CustomClr.kwhite,
                        size: 16),
                  ),
                  IconButton(
                    onPressed: () async {
                      await dbController.deletePassword(index);
                      // ignore: use_build_context_synchronously
                      CommonSnackBar.snackBar(
                          title: "Deleted",
                          clr: CustomClr.kred,
                          context: context);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: CustomClr.kred,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
