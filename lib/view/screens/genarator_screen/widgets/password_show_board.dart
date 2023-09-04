import 'package:flutter/material.dart';
import 'package:password_genarator/controller/getx/res.dart';

class PasswordShowingBoard extends StatelessWidget {
  const PasswordShowingBoard({
    super.key,
    required this.height,
    required this.controller,
  });

  final double height;
  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onPressed: () {}, icon: const Icon(Icons.copy_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.share_outlined))
              ],
            ),
          )
        ],
      ),
    );
  }
}
