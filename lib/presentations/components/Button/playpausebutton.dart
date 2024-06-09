import 'package:earpy_app/controllers/initial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({super.key});

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton>
    with SingleTickerProviderStateMixin {
  final InitialController controller = Get.put(InitialController());
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    controller.isPlaying.listen((isPlaying) {
      if (isPlaying) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (controller.isPlaying.value) {
      controller.pauseAudio();
    } else {
      controller.getCurrentTimes();
      controller
          .playAudio('ocean_waves.mp3'); // Ganti dengan nama file audio Anda
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _togglePlayPause,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pinkAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _animationController,
              size: 100,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Obx(() => Text(
              "Time: ${controller.formattedTime}",
              style: const TextStyle(fontSize: 24, color: Colors.white),
            )),
      ],
    );
  }
}
