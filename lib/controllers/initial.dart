import 'package:audioplayers/audioplayers.dart';
import 'package:earpy_app/datasources/models/historymodel.dart';
import 'package:earpy_app/logic/utils/dateformat.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:uuid/uuid.dart';

class InitialController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  var currentTrack = ''.obs;
  var isPlaying = false.obs;
  var isPlayingAudio = false.obs;
  var timeElapsed = 0.obs;
  var duration = "".obs;
  late Timer timer;
  final uuid = Uuid();

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
      startTimer();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pauseAudio() async {
    try {
      await audioPlayer.pause();
      isPlaying.value = false;
      timer.cancel();
    } catch (e) {
      print("Error pausing audio: $e");
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
    } catch (e) {
      print("Error stopping audio: $e");
    }
  }

  void getCurrentTimes() {
    // Implementasikan sesuai kebutuhan Anda
    String currentDate = getCurrentDate();
    String currentTime = getCurrentTime();
    String nameMonth = getFormattedMonthInID();
    String nameDay = getFormattedDayInID();
    String nameTime = getTimeStatusInID();
    String id = uuid.v4();
    // print(currentDate +
    //     " " +
    //     currentTime +
    //     " " +
    //     nameMonth +
    //     " " +
    //     nameDay +
    //     " " +
    //     nameTime);
    var responseData = HistoryModel(
        id: id,
        date: currentDate,
        day: nameDay,
        month: nameMonth,
        time: currentTime,
        duration: duration.value,
        note: nameTime);
    // print(
    //     "Times : $currentTime\nDate : $currentDate\nMonth : $nameMonth \nDay : ${getFormattedDayInID()}\nTime : ${getTimeStatusInID()}");
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
    Get.toNamed('/daily_journal');
  }

  void gotoTrack() {
    Get.toNamed('/mood_track');
  }

  void gotoInstruction() {
    Get.toNamed('/breath_instruction');
  }
}
