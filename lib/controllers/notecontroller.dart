import 'package:earpy_app/controllers/journalcontroller.dart';
import 'package:earpy_app/datasources/models/request/notereqmodel.dart';
import 'package:earpy_app/datasources/repositories/noterepository.dart';
import 'package:earpy_app/logic/utils/alert.dart';
import 'package:earpy_app/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class NoteController extends GetxController {
  late TextEditingController title;
  late TextEditingController content;
  late TextEditingController id;
  final uuid = const Uuid();
  final journalController = Get.find<JournalController>();
  final statusNote = false.obs;
  final rawData = Rx<NoteModel?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    if (Get.parameters.isNotEmpty) {
      String idData = Get.parameters['id'] as String;
      editNotes(idData);
    }
    title = TextEditingController();
    content = TextEditingController();
    id = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void addNotes() async {
    final titleNotes = title.text;
    final contentNotes = content.text;
    var requestNote =
        NoteModel(id: uuid.v4(), title: titleNotes, content: contentNotes);
    final storeHistory = await NoteRepositoryImpl().addNote(requestNote);
    storeHistory.fold((l) => Alert.error(message: l), (r) {
      Alert.success(message: "Berhasil memasukan data, ${r.title}");
      journalController.getNote();
      Get.offNamed(Alias.dailyJournal);
    });
  }

  void editNotes(String idData) async {
    final note = await NoteRepositoryImpl().getById(idData);
    note.fold((l) => Alert.error(message: l), (r) => rawData.value = r);
    title.text = rawData.value?.title as String;
    content.text = rawData.value?.content as String;
    id.text = rawData.value?.id as String;
    statusNote.value = true;
  }

  void updateNotes() async {
    var requestNote =
        NoteModel(id: id.text, title: title.text, content: content.text);
    final storeHistory =
        await NoteRepositoryImpl().updateNote(id.text, requestNote);
    storeHistory.fold((l) => Alert.error(message: l), (r) {
      Alert.success(message: r);
      statusNote.value = false;
      journalController.getNote();
      Get.offAllNamed(Alias.dailyJournal);
    });
  }

  void gotoDailyJournal() {
    Get.back();
  }
}
