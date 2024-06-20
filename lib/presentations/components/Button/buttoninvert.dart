import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonTitleRadius extends StatelessWidget {
  final void Function() onTap;
  final bool invert;
  final String title;
  final Color colorData;
  const ButtonTitleRadius(
      {super.key,
      required this.onTap,
      this.invert = false,
      required this.title,
      this.colorData = Colors.pinkAccent});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          decoration: BoxDecoration(
              color: invert ? Colors.white : colorData,
              border: Border.all(
                  color: invert ? colorData : Colors.white, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: invert ? colorData : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          )),
    );
  }
}
