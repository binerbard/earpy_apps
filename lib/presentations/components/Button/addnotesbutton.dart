import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNotesButton extends StatelessWidget {
  final void Function() onTap;
  const AddNotesButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 3.0,
              color: Colors.blueAccent,
            )),
        child: const Column(
          children: [
            Icon(
              Icons.add,
              color: Colors.blueAccent,
            ),
            Text(
              "Add Note",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
