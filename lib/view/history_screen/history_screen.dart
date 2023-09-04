import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_genarator/controller/getx/db.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/view/history_screen/widget/delete_dialog.dart';
import 'package:password_genarator/view/widgets/snack_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final dbController = Get.put(DatabaseFuctions());
    return Scaffold(
      backgroundColor: CustomClr.kblack,
      appBar: AppBar(
        backgroundColor: CustomClr.kblack,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: CustomClr.kwhite,
            )),
        title: Text(
          "Password History",
          style: CustomFuc.textStyleFuc(
              fontWeight: FontWeight.w500, color: CustomClr.kwhite, size: 19),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await DeleteDialog.deleteDialog(context);
            },
            tooltip: "Delete All",
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Obx(
              () => Column(
                children: [
                  dbController.passwordHistory.isEmpty
                      ? Center(
                          child: Text(
                            "NOT FOUND",
                            style: CustomFuc.textStyleFuc(
                                fontWeight: FontWeight.bold,
                                color: CustomClr.kwhite,
                                size: 18),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: dbController.passwordHistory.length,
                          itemBuilder: (context, index) {
                            final password =
                                dbController.passwordHistory[index];
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              await dbController.deletePassword(
                                                  dbController
                                                      .passwordHistory[index]
                                                      .id!);
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
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
