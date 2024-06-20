import 'package:earpy_app/controllers/trackcontroller.dart';
import 'package:earpy_app/presentations/components/Button/backbutton.dart';
import 'package:earpy_app/presentations/components/Button/circleiconbutton.dart';
import 'package:earpy_app/presentations/components/StateComponent/datepickermonthyear.dart';
import 'package:earpy_app/presentations/components/StateComponent/statemoodcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackView extends GetView<TrackController> {
  const TrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBackground(
        SafeArea(
          child: SingleChildScrollView(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: (10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Today is :",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey)),
                    Text(controller.nameday.value,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.pinkAccent)),
                    Text(controller.today.value,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey)),
                  ],
                ),
                CircleIconButton(
                  icon: Icons.date_range,
                  onTap: () async {
                    final year = int.parse(controller.dateNow.split("-")[0]);
                    // print(year);
                    final picker = await Get.dialog(StateDatePickerMonthYear(
                      thisYear: year,
                    ));
                    print(picker);
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.pinkAccent,
            width: Get.width,
            height: 2,
          ),
          Obx(
            () => Wrap(
              spacing: 5,
              runSpacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              children: controller.listDate.map((e) {
                final today = int.parse(e.date.split("-")[2]);
                final currentDate = int.parse(controller.dateNow.split("-")[2]);

                return StateMoodCard(
                  mood: e,
                  onTap: () => controller.addMood(),
                  isToday: today <= currentDate,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
