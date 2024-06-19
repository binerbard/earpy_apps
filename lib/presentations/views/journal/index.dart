import 'package:earpy_app/controllers/journalcontroller.dart';
import 'package:earpy_app/presentations/components/Button/addnotesbutton.dart';
import 'package:earpy_app/presentations/components/Button/backbutton.dart';
import 'package:earpy_app/presentations/components/Card/historycard.dart';
import 'package:earpy_app/presentations/components/Card/lashistorycard.dart';
import 'package:earpy_app/presentations/components/Card/notescard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JournalView extends GetView<JournalController> {
  const JournalView({super.key});
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
            const SizedBox(height: 40),
            EarpyBackButton(onTap: () => controller.gotoEarpy()),
            const SizedBox(height: 40),
            const Text(
              'Daily Journal',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            HistoryCard(
              child: Obx(() {
                final lastHistory = controller.lastHistory.value;
                if (lastHistory != null) {
                  return Column(
                    children: [
                      LastHisotryCard(
                        data: lastHistory,
                      ),
                      InkWell(
                        onTap: () {
                          controller.gotoListHistories();
                        },
                        child: Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(5),
                          child: const Center(
                              child: Column(
                            children: [
                              Text(
                                "See More",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.pinkAccent),
                              ),
                              Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          )),
                        ),
                      )
                    ],
                  );
                }
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                      child: Obx(() => Text(
                            controller.messageHistory.value,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ))),
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            NotesCardSection(
              widget: Column(
                children: [
                  AddNotesButton(onTap: () {
                    controller.gotoNotes();
                  }),
                  SizedBox(
                    height: Get.height / 3,
                    child: SingleChildScrollView(
                      child: Obx(() {
                        if (controller.listNotes.isNotEmpty) {
                          return Column(
                            children: controller.listNotes
                                .map((el) => Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.pinkAccent.shade700,
                                              Colors.pinkAccent.shade400
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ListTile(
                                        onTap: () {
                                          controller.gotoNoteDisplay(el.id);
                                        },
                                        contentPadding:
                                            const EdgeInsets.all(15),
                                        title: Text(
                                          el.title,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        leading: const Icon(
                                          Icons.blur_circular_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          );
                        }
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                              child: Obx(() => Text(
                                    controller.messageNotes.value,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ))),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
