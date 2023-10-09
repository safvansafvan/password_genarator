import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:password_genarator/controller/getx/db.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/view/screens/history_screen/widget/delete_dialog.dart';
import 'package:password_genarator/view/screens/history_screen/widget/password_show_widget.dart';

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
          "Passwords History",
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
        onRefresh: () async {
          dbController.getAllPassword();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Obx(
              () => dbController.passwordHistory.isEmpty
                  ? Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'NOT FOUND',
                            style: CustomFuc.textStyleFuc(
                                fontWeight: FontWeight.bold,
                                color: CustomClr.kwhite,
                                size: 17),
                          ),
                        )
                      ],
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dbController.passwordHistory.length,
                      itemBuilder: (context, index) {
                        final password = dbController.passwordHistory[index];
                        return PasswordShowingWidget(
                          screenHeight: screenHeight,
                          password: password,
                          dbController: dbController,
                          index: dbController.passwordHistory[index].id!,
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
