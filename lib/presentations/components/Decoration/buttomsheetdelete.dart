import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtomSheetDelete extends StatelessWidget {
  final void Function()? onDelete;
  final void Function()? onCancel;

  const ButtomSheetDelete({super.key, this.onDelete, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      width: Get.width,
      height: Get.height * 0.4,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          children: [
            const Text(
              "Hapus Note",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
            ),
            const Spacer(),
            IconButton(
              onPressed: onCancel,
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        Icon(
          Icons.delete_forever_outlined,
          color: Colors.pinkAccent,
          size: Get.width * 0.2,
        ),
        const SizedBox(height: 20),
        const Text(
          "Apakah anda yakin ingin menghapus note ini?",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 1,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            width: Get.width * 0.4,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: onDelete,
              child: const Text("Hapus",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            width: Get.width * 0.4,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pinkAccent,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: onCancel,
              child: const Text("Tidak",
                  style: TextStyle(
                      color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
            ),
          ),
        ])
      ]),
    );
  }
}
