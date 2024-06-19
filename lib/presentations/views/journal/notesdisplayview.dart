import 'package:earpy_app/controllers/notesdisplaycontroller.dart';
import 'package:earpy_app/presentations/components/Button/circleiconbutton.dart';
import 'package:earpy_app/presentations/components/Decoration/buttomsheetdelete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesDisplayView extends GetView<NotesDisplayController> {
  const NotesDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
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
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleIconButton(
                                  icon: Icons.arrow_back,
                                  onTap: () {
                                    controller.gotoDailyJournal();
                                  }),
                              Row(
                                children: [
                                  CircleIconInvertButton(
                                      icon: Icons.delete_outline_outlined,
                                      onTap: () {
                                        controller.openButtomSheet(
                                            ButtomSheetDelete(
                                                onDelete: () => controller
                                                    .gotoAccpeteDelete(
                                                        controller
                                                            .idNote.value),
                                                onCancel: () => controller
                                                    .gotoCancelDelete()));
                                      }),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  CircleIconButton(
                                      icon: Icons.edit_document,
                                      onTap: () {
                                        controller.updateNotesContent();
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.pinkAccent)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(
                                    controller.title.value,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                width: Get.width,
                                height: 2,
                                color: Colors.pinkAccent,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Obx(() => Text(
                                      controller.content.value,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          )),
    ));
  }
}
