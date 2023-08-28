import 'package:flutter/material.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/view/history_screen/history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool switchvalue = true;
    double sliderValue = 12;
    return Scaffold(
      backgroundColor: CustomClr.kblack,
      appBar: AppBar(
        backgroundColor: CustomClr.kblack,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeight.commonHeight,
            Container(
              height: 160,
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
                  const Center(child: Text("Password")),
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
            CustomHeight.commonHeight,
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
                      Switch(
                        value: switchvalue,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  CustomHeight.commonHeight,
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
                      Switch(
                        value: switchvalue,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  CustomHeight.commonHeight,
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
                      Switch(
                        value: switchvalue,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  CustomHeight.commonHeight,
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
                      Slider(
                        value: sliderValue,
                        min: 5,
                        max: 20,
                        onChanged: (value) {},
                      ),
                      Text(
                        "20",
                        style: CustomFuc.textStyleFuc(
                            fontWeight: FontWeight.bold,
                            color: CustomClr.kwhite,
                            size: 15),
                      )
                    ],
                  ),
                ],
              ),
            ),
            CustomHeight.commonHeight,
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          const BorderSide(width: 2, color: Colors.deepPurple)),
                )),
                child: const Text('Genarate'),
              ),
            ),
            CustomHeight.commonHeight,
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
    );
  }
}
