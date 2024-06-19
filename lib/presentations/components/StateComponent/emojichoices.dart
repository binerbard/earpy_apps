import 'package:earpy_app/datasources/models/request/emojireqmodel.dart';
import 'package:earpy_app/presentations/components/StateComponent/emojioptionitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateEmojiChoices extends StatelessWidget {
  final Rx<EmojiModel?> emojiPresent;
  final RxBool showTextField;
  final List<EmojiModel> emojiOption;
  const StateEmojiChoices(
      {super.key,
      required this.emojiPresent,
      required this.showTextField,
      required this.emojiOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: emojiOption
            .map((e) => StateEmojiOptionItem(
                emoji: e,
                emojiPresent: emojiPresent,
                showTextField: showTextField))
            .toList(),
      ),
    );
  }
}
