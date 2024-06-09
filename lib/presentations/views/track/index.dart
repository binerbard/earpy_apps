import 'package:earpy_app/controllers/trackcontroller.dart';
import 'package:earpy_app/presentations/components/Button/backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/Card/card.dart';

class TrackView extends GetView<TrackController> {
  const TrackView({super.key});

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
          children: <Widget>[
            const SizedBox(height: 40),
            EarpyBackButton(onTap: () => controller.gotoEarpy()),
            const SizedBox(height: 40),
            const Text(
              'Mood Track',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: const <Widget>[
                  JournalCard(text: 'Mood Track'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
