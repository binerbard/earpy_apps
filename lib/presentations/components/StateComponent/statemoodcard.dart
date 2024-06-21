import 'package:earpy_app/datasources/models/request/moodreqmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class StateMoodCard extends StatelessWidget {
  final MoodTrackReqModel mood;
  final bool isToday;
  final bool isAvailable;
  final void Function() onTap;
  const StateMoodCard(
      {super.key,
      required this.mood,
      required this.isToday,
      required this.onTap,
      required this.isAvailable});

  Color _changeColor(bool isToday, bool isAvailable) {
    if (isAvailable) {
      if (isToday) {
        return Colors.pinkAccent;
      }
      return Colors.blue.shade900;
    }
    return Colors.grey.shade700;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: Get.width / 7,
      height: Get.width / 7,
      child: InkWell(
        onTap: isAvailable ? onTap : null,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade800, width: 2),
                  color: _changeColor(isToday, isAvailable)),
              child: Center(
                child: Text(
                  mood.number,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (mood.emoji != null)
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Lottie.asset(mood.emoji!, height: Get.height * 0.03))
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
