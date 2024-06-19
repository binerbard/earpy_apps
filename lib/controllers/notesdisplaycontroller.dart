import 'package:earpy_app/datasources/models/request/notereqmodel.dart';
import 'package:earpy_app/datasources/repositories/noterepository.dart';
import 'package:earpy_app/logic/utils/alert.dart';
import 'package:earpy_app/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesDisplayController extends GetxController {
  final rawData = Rx<NoteModel?>(null);
  final idNote = "".obs; // Assuming you have a way to populate this
  final title = "".obs;
  final content = "".obs;

  @override
  void onInit() {
    if (Get.parameters.isEmpty) {
      Get.offNamed(Alias.dailyJournal);
    } else {
      final idData = Get.parameters['id'];
      if (idData != null) {
        showNotes(idData);
      } else {
        // Handle case where 'id' parameter is missing
        Alert.error(message: "Missing note ID in parameters");
      }
    }

    super.onInit();
  }

  void showNotes(String id) async {
    try {
      final responseNote = await NoteRepositoryImpl().getById(id);
      responseNote.fold(
          (e) => Alert.error(message: e.toString()), (r) => rawData.value = r);

      if (rawData.value != null) {
        title.value = rawData.value!.title;
        content.value = rawData.value!.content;
        idNote.value = rawData.value!.id;
      }
    } catch (e) {
      // Handle specific exceptions or provide a general error message
      Alert.error(message: "Error fetching note: $e");
    }
  }

  void updateNotesContent() {
    Get.toNamed(Alias.note, parameters: {"id": idNote.value});
  }

  void gotoDailyJournal() {
    Get.back();
  }

  void gotoCancelDelete() {
    Get.back();
  }

  void gotoAccpeteDelete(String id) async {
    final storeHistory = await NoteRepositoryImpl().deleteNote(id);
    storeHistory.fold((l) => Alert.error(message: l), (r) {
      Alert.success(message: r);
      Get.offAllNamed(Alias.dailyJournal);
    });
  }

  void openButtomSheet(Widget content) {
    Get.bottomSheet(
      content,
      elevation: 10.0,
      shape: const RoundedRectangleBorder(
        // Use RoundedRectangleBorder for border with radius
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        side: BorderSide(color: Colors.purpleAccent), // Set border color
      ),
    );
  }
}
