import 'package:earpy_app/datasources/models/request/moodreqmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateMoodCard extends StatelessWidget {
  final MoodTrack mood;
  final bool isToday;
  final void Function() onTap;
  const StateMoodCard(
      {super.key,
      required this.mood,
      required this.isToday,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: Get.width / 5,
      height: Get.width / 5,
      child: InkWell(
        onTap: isToday ? onTap : null,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: isToday ? Colors.pinkAccent : Colors.blue.shade900),
              color: isToday ? Colors.pinkAccent : Colors.blue.shade900),
          child: Center(
            child: Text(
              mood.emoji,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
