import 'package:earpy_app/controllers/initial.dart';
import 'package:earpy_app/presentations/components/Button/playpausebutton.dart';
import 'package:flutter/material.dart';
import './../../components/Button/settingbutton.dart';
import 'package:get/get.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            const Text(
              'Earpy',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(
              child: Center(
                child: PlayPauseButton(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BottomNavItem(
                      icon: Icons.book,
                      label: "Daily Journal",
                      onTap: () => controller.gotoJournal()),
                  BottomNavItem(
                    icon: Icons.mood,
                    label: 'Mood Track',
                    onTap: () => controller.gotoTrack(),
                  ),
                  BottomNavItem(
                    icon: Icons.self_improvement,
                    label: 'Breath Instruction',
                    onTap: () => controller.gotoInstruction(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
