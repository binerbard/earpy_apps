import 'package:earpy_app/datasources/models/request/emojireqmodel.dart';
import 'package:earpy_app/presentations/components/Button/buttoninvert.dart';
import 'package:earpy_app/presentations/components/StateComponent/emojichoices.dart';
import 'package:earpy_app/presentations/components/StateComponent/emojirepresent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogEmoji extends StatelessWidget {
  final Rx<EmojiModel?> emojiPresent;
  final RxBool showTextField;
  final List<EmojiModel> emojiOption;
  final TextEditingController content;
  final void Function() onAccept;
  final void Function() onCancel;
  const AlertDialogEmoji({
    super.key,
    required this.emojiPresent,
    required this.showTextField,
    required this.emojiOption,
    required this.content,
    required this.onAccept,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: Get.width * 0.8,
            height: Get.height * 0.5,
            child: Column(
              children: [
                const SizedBox(height: 70),
                const Text("How's your vibe today?"),
                StateEmojiChoices(
                  emojiPresent: emojiPresent,
                  showTextField: showTextField,
                  emojiOption: emojiOption,
                ),
                Obx(
                  () => AnimatedOpacity(
                    opacity: showTextField.value ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            controller: content,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              labelText: 'Can you tell me?',
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                        ButtonTitleRadius(
                          onTap: onAccept,
                          title: "Send",
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonTitleRadius(
                  onTap: onCancel,
                  title: "Cancel",
                  invert: true,
                ),
              ],
            ),
          ),
          StateEmojiRepresent(
            emoji: emojiPresent,
          )
        ],
      ),
    );
  }
}
