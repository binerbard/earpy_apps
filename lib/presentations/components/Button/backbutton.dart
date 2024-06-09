import 'package:flutter/material.dart';

class EarpyBackButton extends StatelessWidget {
  final void Function() onTap;
  const EarpyBackButton({super.key, required this.onTap});

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
        child: const Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.pinkAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Earpy',
              style: TextStyle(
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
