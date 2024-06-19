import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final double? sizeButton;
  final double? sizeIcon;
  final Color colorButton;
  const CircleIconButton(
      {super.key,
      required this.icon,
      this.onTap,
      this.sizeButton = 15,
      this.sizeIcon = 20,
      this.colorButton = Colors.pinkAccent});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(sizeButton!),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 3),
            spreadRadius: 1,
            blurRadius: 5,
          )
        ], shape: BoxShape.circle, color: colorButton),
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

class CircleIconInvertButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final double? sizeButton;
  final double? sizeIcon;
  final Color colorButton;
  const CircleIconInvertButton(
      {super.key,
      required this.icon,
      this.onTap,
      this.sizeButton = 15,
      this.sizeIcon = 20,
      this.colorButton = Colors.pinkAccent});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(sizeButton!),
        decoration: BoxDecoration(
            border: Border.all(color: colorButton, width: 4),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 3),
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],
            shape: BoxShape.circle,
            color: Colors.white),
        child: Center(
          child: Icon(
            icon,
            color: colorButton,
            size: sizeIcon,
          ),
        ),
      ),
    );
  }
}
