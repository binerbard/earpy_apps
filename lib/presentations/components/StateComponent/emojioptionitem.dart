import 'package:earpy_app/datasources/models/request/emojireqmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class StateEmojiOptionItem extends StatelessWidget {
  final EmojiModel emoji;
  final RxBool showTextField;
  final Rx<EmojiModel?> emojiPresent;
  const StateEmojiOptionItem(
      {super.key,
      required this.emojiPresent,
      required this.showTextField,
      required this.emoji});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        emojiPresent.value = emoji;
        showTextField.value = true;
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 3),
              spreadRadius: 1,
              blurRadius: 5,
            )
          ],
        ),
        child: Lottie.asset(emoji.emoji, height: 50),
      ),
    );
  }
}
