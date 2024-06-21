import 'package:audioplayers/audioplayers.dart';
import 'package:earpy_app/datasources/models/request/historyreqmodel.dart';
import 'package:earpy_app/datasources/repositories/historyrepository.dart';
import 'package:earpy_app/logic/utils/alert.dart';
import 'package:earpy_app/logic/utils/dateformat.dart';
import 'package:earpy_app/routes/path.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:uuid/uuid.dart';

class InitialController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  var currentTrack = ''.obs;
  var isPlaying = false.obs;
  var isPlayingAudio = false.obs;
  var timeElapsed = 0.obs;
  var startTime = " ".obs;
  var endTime = " ".obs;
  var duration = "".obs;
  late Timer timer;
  final listHistory = [].obs;
  final uuid = const Uuid();

  @override
  void onInit() {
    super.onInit();
    audioPlayer.onPlayerComplete.listen((event) {
      if (isPlayingAudio.value) {
        audioPlayer.seek(Duration.zero);
        audioPlayer.resume();
      }
    });
  }

  void playAudio(String fileName) async {
    try {
      await audioPlayer.stop();
      await audioPlayer.setSource(AssetSource('audio/$fileName'));
      await audioPlayer.resume();
      isPlaying.value = true;
      currentTrack.value = fileName;
      isPlayingAudio.value = true;
      startTime.value = getCurrentTime();
      startTimer();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void stopAudio() async {
    try {
      await audioPlayer.stop();
      isPlaying.value = false;
      currentTrack.value = '';
      isPlayingAudio.value = false;
      timer.cancel();
      timeElapsed.value = 0;
      endTime.value = getCurrentTime();
      getCurrentTimes();
    } catch (e) {
      print("Error stoppin audio: $e");
    }
  }

  void getCurrentTimes() async {
    // Implementasikan sesuai kebutuhan Anda
    String currentDate = getCurrentDate();
    DateTime convertDate = DateTime.now();
    String nameMonth = getFormattedMonthInID(convertDate);
    String nameDay = getFormattedDayInID(convertDate);
    String nameTime = getTimeStatusInID(convertDate);
    String id = uuid.v4();
    var requestHistory = HistoryModel(
        id: id,
        date: currentDate,
        day: nameDay,
        month: nameMonth,
        dayperiod: nameTime,
        startTime: startTime.value,
        endTime: endTime.value,
        duration: duration.value,
        note: "");
    final storeHistory =
        await HistoryRepositoryImpl().addHistory(requestHistory);
    storeHistory.fold((l) => Alert.error(message: l), (r) {
      Alert.success(
          message:
              "Berhasil memasukan data, ${r.day} ${r.dayperiod}, ${r.date}");
    });
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (Timer timer) {
      if (!isPlaying.value) {
        timer.cancel();
      } else {
        timeElapsed.value++;
      }
    });
  }

  String get formattedTime {
    int seconds = timeElapsed.value % 60;
    int minutes = (timeElapsed.value ~/ 60) % 60;
    int hours = (timeElapsed.value ~/ 3600);

    duration.value =
        "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";

    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  }

  void gotoJournal() {
    Get.toNamed(Alias.dailyJournal);
  }

  void gotoTrack() {
    Get.toNamed(Alias.moodTrack);
  }

  void gotoInstruction() {
    Get.toNamed(Alias.breathInstruction);
  }
}
