import 'package:earpy_app/datasources/models/request/emojireqmodel.dart';
import 'package:earpy_app/datasources/models/request/moodreqmodel.dart';
import 'package:earpy_app/logic/utils/dateformat.dart';
import 'package:earpy_app/presentations/components/Decoration/alertdialogemoji.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TrackController extends GetxController {
  final now = DateTime.now();
  final dateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final content = TextEditingController();
  final listDate = <MoodTrack>[].obs;
  final emojiSelected = Rx<EmojiModel?>(null);
  final showTextField = false.obs;
  final emojiOption = [
    EmojiModel(id: "1", emoji: 'assets/emoji/very-happy.json'),
    EmojiModel(id: "2", emoji: 'assets/emoji/happy.json'),
    EmojiModel(id: "3", emoji: 'assets/emoji/normal.json'),
    EmojiModel(id: "4", emoji: 'assets/emoji/angry.json'),
    EmojiModel(id: "5", emoji: 'assets/emoji/very-angry.json'),
  ].obs;

  @override
  void onInit() {
    initialSelectedEmoji();
    getDateNow();
    super.onInit();
  }

  void initialSelectedEmoji() {
    emojiSelected.value = emojiOption.first;
  }

  void getDateNow() {
    listDate.value = getDatesForMood(now.month, now.year);
  }

  void onAccept() {
    print(content.text);
    print("Emoji Selected: ${emojiSelected.value!.emoji}");
    Get.back();
  }

  void onCancel() {
    Get.back();
  }

  void addMood() {
    content.text = "";
    showTextField.value = false;
    Get.dialog(AlertDialogEmoji(
        emojiPresent: emojiSelected,
        showTextField: showTextField,
        emojiOption: emojiOption,
        content: content,
        onAccept: onAccept,
        onCancel: onCancel));
  }

  void gotoEarpy() {
    Get.back();
  }
}
