import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:password_genarator/controller/getx/db.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/controller/getx/res.dart';
import 'package:password_genarator/model/password.dart';
import 'package:password_genarator/view/screens/genarator_screen/widgets/button_field_widget.dart';
import 'package:password_genarator/view/screens/genarator_screen/widgets/password_show_board.dart';
import 'package:password_genarator/view/screens/history_screen/history_screen.dart';
import 'package:password_genarator/view/widgets/snack_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final dbController = Get.put(DatabaseFuctions());
    dbController.getAllPassword();
    final controller = Get.put(Controller());
    return Scaffold(
      backgroundColor: CustomClr.kblack,
      appBar: AppBar(
        backgroundColor: CustomClr.kblack,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: CustomClr.kwhite,
            )),
        title: Text(
          "Password Genarator",
          style: CustomFuc.textStyleFuc(
              fontWeight: FontWeight.w500, color: CustomClr.kwhite, size: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_outline,
                color: CustomClr.kwhite,
              ))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeight.commonHeight(context),
              PasswordShowingBoard(height: height, controller: controller),
              CustomHeight.commonHeight(context),
              ButtonsFieldsWidget(controller: controller),
              CustomHeight.commonHeight(context),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.charector.isFalse &&
                        controller.numbers.isFalse &&
                        controller.specialChar.isFalse) {
                      CommonSnackBar.snackBar(
                          title: "Add Any Condition",
                          clr: CustomClr.kred,
                          context: context);
                    } else {
                      await genarateButtonClick(
                          controller: controller,
                          dbController: dbController,
                          context: context);
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            width: 2, color: Colors.deepPurple)),
                  )),
                  child: const Text('Genarate'),
                ),
              ),
              CustomHeight.commonHeight(context),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'History',
                      style: CustomFuc.textStyleFuc(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          size: 14),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future genarateButtonClick(
      {required Controller controller,
      required DatabaseFuctions dbController,
      required context}) async {
    controller.passwordController.text = controller.genaratePassword(
        length: controller.sliderValue.value,
        letters: controller.charector.value,
        numbers: controller.numbers.value,
        specialCharec: controller.specialChar.value);
    DateTime date = DateTime.now();
    String time = "${date.hour}:${date.minute}";
    PasswordModel passwordModel =
        PasswordModel(password: controller.passwordController.text, time: time);
    await dbController.addPassword(passwordModel);
  }
}
