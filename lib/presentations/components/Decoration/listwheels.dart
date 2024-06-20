import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecorationListWheel extends StatelessWidget {
  final void Function(int)? onSelectedItemChanged;
  final int? childCount;
  final Widget? Function(BuildContext, int) builder;
  const DecorationListWheel(
      {super.key,
      this.onSelectedItemChanged,
      this.childCount,
      required this.builder});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 4),
      ),
      height: Get.height * 0.3,
      width: Get.width * 0.3,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        diameterRatio: 1.0,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: onSelectedItemChanged,
        childDelegate: ListWheelChildBuilderDelegate(
            childCount: childCount, builder: builder),
      ),
    );
  }
}
