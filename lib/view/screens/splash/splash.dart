import 'package:flutter/material.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/view/screens/genarator_screen/genarator_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigatorToHome(context);
    });
    return Scaffold(
      backgroundColor: CustomClr.kblack,
      body: Center(
        child: Text(
          "Password Genarator",
          style: CustomFuc.textStyleFuc(
              fontWeight: FontWeight.bold, color: CustomClr.kwhite, size: 20),
        ),
      ),
    );
  }

  Future<void> navigatorToHome(context) async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
