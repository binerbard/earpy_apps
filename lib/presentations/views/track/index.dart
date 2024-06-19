import 'package:earpy_app/controllers/trackcontroller.dart';
import 'package:earpy_app/datasources/models/request/moodreqmodel.dart';
import 'package:earpy_app/presentations/components/Button/backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackView extends GetView<TrackController> {
  const TrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBackground(
        SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              EarpyBackButton(
                onTap: () {},
              ),
              const SizedBox(height: 40),
              _buildTitle(),
              const SizedBox(height: 20),
              _buildCardWrapper(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(Widget child) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pinkAccent, Colors.purpleAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Mood Track',
      style: TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCardWrapper() {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.pinkAccent),
      ),
      child: SizedBox(
        height: Get.height * 0.6,
        child: SingleChildScrollView(
          child: Obx(
            () => Wrap(
              spacing: 5,
              runSpacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              children: controller.listDate.map(_buildMoodCard).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodCard(MoodTrack mood) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: Get.width / 5,
      height: Get.width / 5,
      child: InkWell(
        onTap: () => controller.addMood(),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.pinkAccent),
              color: Colors.pinkAccent),
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
