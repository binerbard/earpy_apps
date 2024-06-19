import 'package:flutter/material.dart';

class EarpyBackButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const EarpyBackButton({super.key, required this.onTap, this.title = "Earpy"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back,
              color: Colors.pinkAccent,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title, // Remove "${}" to directly use variable
              style: const TextStyle(
                fontSize: 20,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
