import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  final title = TextEditingController();
  final content = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("Close Apps");
    super.onClose();
  }

  void addNotes() {
    final titleNotes = title.text;
    final contentNotes = content.text;

    if (titleNotes.isEmpty) {
      print("draft");
    }
    print(title.text);
    print(content.text);
  }
}
