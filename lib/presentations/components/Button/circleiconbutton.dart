import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final double? sizeButton;
  final double? sizeIcon;
  const CircleIconButton(
      {super.key,
      required this.icon,
      this.onTap,
      this.sizeButton = 15,
      this.sizeIcon = 20});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(sizeButton!),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.pinkAccent),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: sizeIcon,
          ),
        ),
      ),
    );
  }
}
