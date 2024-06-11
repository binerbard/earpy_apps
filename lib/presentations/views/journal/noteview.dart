import 'package:earpy_app/controllers/notecontroller.dart';
import 'package:earpy_app/presentations/components/Button/circleiconbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
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
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: const Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleIconButton(
                                    icon: Icons.arrow_back,
                                    onTap: () => Get.back()),
                                InkWell(
                                  onTap: () {
                                    print("Add pined");
                                  },
                                  child: const Icon(Icons.push_pin_sharp),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Form(
                                child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.title,
                                  decoration: const InputDecoration(
                                      labelText: "Title",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: controller.content,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                      labelText: "Typing here...",
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                  maxLines: Get.height ~/ 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: CircleIconButton(
                                          icon: Icons.save,
                                          sizeIcon: 30,
                                          onTap: () {
                                            controller.addNotes();
                                          }),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          )
                        ],
                      )),
                )
              ],
            )));
  }
}
