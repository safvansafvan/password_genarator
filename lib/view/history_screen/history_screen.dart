import 'package:flutter/material.dart';
import 'package:password_genarator/controller/core/constent.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              fontWeight: FontWeight.w500, color: CustomClr.kwhite, size: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              tooltip: "Delete All",
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 19,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Password",
                        style: CustomFuc.textStyleFuc(
                            fontWeight: FontWeight.w500,
                            color: CustomClr.kwhite,
                            size: 15),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
