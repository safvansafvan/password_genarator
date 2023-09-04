import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_genarator/controller/getx/db.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/controller/getx/res.dart';
import 'package:password_genarator/model/password.dart';
import 'package:password_genarator/view/history_screen/history_screen.dart';
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
              Container(
                height: height * 0.23,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Color.fromARGB(255, 202, 190, 190)],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                      readOnly: true,
                      textAlign: TextAlign.center,
                      controller: controller.passwordController,
                      style: const TextStyle(fontSize: 20),
                    )),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.copy_outlined)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share_outlined))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CustomHeight.commonHeight(context),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 46),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Numbers",
                          style: CustomFuc.textStyleFuc(
                              fontWeight: FontWeight.bold,
                              color: CustomClr.kwhite,
                              size: 17),
                        ),
                        GetBuilder<Controller>(builder: (_) {
                          return Switch(
                            value: controller.numbers.value,
                            onChanged: (value) {
                              controller.numbersONorOff(value);
                            },
                          );
                        })
                      ],
                    ),
                    CustomHeight.commonHeight(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Charectors",
                          style: CustomFuc.textStyleFuc(
                              fontWeight: FontWeight.bold,
                              color: CustomClr.kwhite,
                              size: 17),
                        ),
                        GetBuilder<Controller>(builder: (_) {
                          return Switch(
                            value: controller.charector.value,
                            onChanged: (value) {
                              controller.charectorsOnorOff(value);
                            },
                          );
                        })
                      ],
                    ),
                    CustomHeight.commonHeight(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Special Charectors",
                          style: CustomFuc.textStyleFuc(
                              fontWeight: FontWeight.bold,
                              color: CustomClr.kwhite,
                              size: 17),
                        ),
                        GetBuilder<Controller>(builder: (_) {
                          return Switch(
                            value: controller.specialChar.value,
                            onChanged: (value) {
                              controller.specialCharectorOnorOff(value);
                            },
                          );
                        })
                      ],
                    ),
                    CustomHeight.commonHeight(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Length",
                          style: CustomFuc.textStyleFuc(
                              fontWeight: FontWeight.bold,
                              color: CustomClr.kwhite,
                              size: 17),
                        ),
                        GetBuilder<Controller>(builder: (_) {
                          return Slider(
                            value: controller.sliderValue.value.toDouble(),
                            min: 6,
                            max: 15,
                            onChanged: (value) {
                              controller.sliderUpdates(value);
                            },
                          );
                        }),
                        GetBuilder<Controller>(builder: (_) {
                          return Text(
                            "${controller.sliderValue.value}",
                            style: CustomFuc.textStyleFuc(
                                fontWeight: FontWeight.bold,
                                color: CustomClr.kwhite,
                                size: 15),
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
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
