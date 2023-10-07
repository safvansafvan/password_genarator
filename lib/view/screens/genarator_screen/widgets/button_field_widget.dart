import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_genarator/controller/core/constent.dart';
import 'package:password_genarator/controller/getx/res.dart';

class ButtonsFieldsWidget extends StatelessWidget {
  const ButtonsFieldsWidget({
    super.key,
    required this.controller,
  });

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              }),
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
    );
  }
}
