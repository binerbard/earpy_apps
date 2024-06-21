import 'package:earpy_app/datasources/models/request/emojireqmodel.dart';
import 'package:earpy_app/datasources/models/request/moodreqmodel.dart';
import 'package:earpy_app/datasources/models/response/moodresmodel.dart';
import 'package:earpy_app/datasources/repositories/moodtrackrepository.dart';
import 'package:earpy_app/logic/utils/alert.dart';
import 'package:earpy_app/logic/utils/dateformat.dart';
import 'package:earpy_app/presentations/components/Decoration/alertdialogemoji.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TrackController extends GetxController {
  final now = DateTime.now();
  final setYear = 0.obs;
  final setMonth = 0.obs;
  final nameday = "".obs;
  final today = "".obs;
  final dateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final content = TextEditingController();
  final listMoodTrack = <MoodTrackReqModel>[].obs;
  final dataMoodTrack = Rx<MoodTrackResModel?>(null);
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
    resetDateNow();
    super.onInit();
  }

  void initialSelectedEmoji() {
    nameday.value = getFormattedDayInID(now);
    String month = getFormattedMonthInID(now);
    List<String> fetchDate = dateNow.split("-");
    today.value = "${fetchDate[2]}-$month-${fetchDate[0]}";
    emojiSelected.value = emojiOption.first;
  }

  void resetDateNow() async {
    setYear.value = now.year;
    setMonth.value = now.month;

    final response = await MoodTrackRepositoryImpl()
        .getMoodTracByMonthAndYear(setYear.value, setMonth.value);
    response.fold((l) => Alert.error(message: l), (r) {
      dataMoodTrack.value = r;
      listMoodTrack.value = r.listMoodTrack;
    });
  }

  void setDateNow(String month, String year) async {
    setMonth.value = int.parse(month);
    setYear.value = int.parse(year);
    final response = await MoodTrackRepositoryImpl()
        .getMoodTracByMonthAndYear(setYear.value, setMonth.value);
    response.fold((l) => Alert.error(message: l), (r) {
      dataMoodTrack.value = r;
      listMoodTrack.value = r.listMoodTrack;
    });
  }

  void onAccept(String id) async {
    bool status = false;
    final index =
        dataMoodTrack.value!.listMoodTrack.indexWhere((e) => e.id == id);
    if (index != -1) {
      final moodTrack = dataMoodTrack.value!.listMoodTrack[index];
      dataMoodTrack.value!.listMoodTrack[index] = MoodTrackReqModel(
          id: id,
          number: moodTrack.number,
          date: moodTrack.date,
          emoji: emojiSelected.value!.emoji,
          content: content.text);
    }

    final response =
        await MoodTrackRepositoryImpl().storeMoodTrack(dataMoodTrack.value!);
    response.fold((l) => Alert.error(message: l), (r) {
      status = true;
    });

    Get.back(result: status);
  }

  void onCancel() {
    Get.back();
  }

  void addMood(String id) async {
    content.text = "";
    showTextField.value = false;
    final dialog = await Get.dialog(AlertDialogEmoji(
        emojiPresent: emojiSelected,
        showTextField: showTextField,
        emojiOption: emojiOption,
        content: content,
        onAccept: () async => onAccept(id),
        onCancel: onCancel));
    // print(dialog);
    if (dialog != null) {
      setDateNow(setMonth.value.toString(), setYear.value.toString());
    }
  }

  void gotoEarpy() {
    Get.back();
  }
}
