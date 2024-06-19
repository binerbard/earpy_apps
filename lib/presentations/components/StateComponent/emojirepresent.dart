import 'package:earpy_app/datasources/models/request/emojireqmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class StateEmojiRepresent extends StatelessWidget {
  final Rx<EmojiModel?> emoji;
  const StateEmojiRepresent({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Obx(() => Lottie.asset(emoji.value!.emoji, height: 100)),
      ),
    );
  }
}
