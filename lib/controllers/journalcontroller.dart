import 'package:earpy_app/datasources/models/request/historyreqmodel.dart';
import 'package:earpy_app/datasources/models/request/notereqmodel.dart';
import 'package:earpy_app/datasources/repositories/historyrepository.dart';
import 'package:earpy_app/datasources/repositories/noterepository.dart';
import 'package:earpy_app/routes/path.dart';
import 'package:get/get.dart';

class JournalController extends GetxController {
  final listHisotries = List<HistoryModel>.empty().obs;
  final lastHistory = Rx<HistoryModel?>(null);
  final countHisotry = 0.obs;
  final messageHistory = "".obs;

  final listNotes = List<NoteModel>.empty().obs;
  final lastNote = Rx<NoteModel?>(null);
  final countNote = 0.obs;
  final messageNotes = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit

    getHistory();
    getNote();
    super.onInit();
  }

  void getHistory() async {
    final responseHisotry = await HistoryRepositoryImpl().listHistories();
    responseHisotry.fold((l) => messageHistory.value = l, (r) {
      listHisotries.value = r.listHistories.reversed.toList();
      lastHistory.value = listHisotries.first;
      countHisotry.value = r.countHistory;
    });
  }

  void getNote() async {
    final responseNote = await NoteRepositoryImpl().listNotes();
    responseNote.fold((l) => messageNotes.value = l, (r) {
      listNotes.value = r.listNotes.reversed.toList();
      lastNote.value = listNotes.first;
      countNote.value = r.countNote;
    });
  }

  void gotoNoteDisplay(String id) {
    Get.toNamed(Alias.notesDisplay, parameters: {'id': id});
  }

  void gotoEarpy() {
    Get.offAllNamed(Alias.initial);
    // Get.toNamed(Path.earpy);
  }

  void gotoListHistories() {
    Get.toNamed(Alias.historyList);
  }

  void gotoNotes() {
    Get.toNamed(Alias.note);
  }
}
