import 'package:earpy_app/controllers/historylistcontroller.dart';
import 'package:earpy_app/presentations/components/Button/backbutton.dart';
import 'package:earpy_app/presentations/components/Card/lashistorycard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryListView extends GetView<HistoryListController> {
  const HistoryListView({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 40),
                  EarpyBackButton(
                      title: "Daily Journal",
                      onTap: () => controller.gotoDailyJournal()),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.pinkAccent, width: 3.0),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 5.0),
                    child: Obx(() {
                      final lastHistory = controller.lastHistory.value;
                      if (lastHistory != null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Adveture History",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pinkAccent),
                            ),
                            LastHisotryCard(
                              data: lastHistory,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.pinkAccent)),
                              child: ListTile(
                                  title: const Text(
                                    "Adventure Logs",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  leading: const Icon(Icons.timeline),
                                  trailing: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${controller.countHistories}x",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.book,
                                            color: Colors.red,
                                            size:
                                                14, // Sesuaikan dengan ukuran ikon yang diinginkan
                                          ),
                                        ),
                                        // Jika Anda ingin menambahkan spasi di antara angka dan ikon hati, tambahkan TextSpan yang berisi spasi di sini
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        );
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Center(
                          child: Text(
                            "History Belum Tersedia",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(left: 30.0, top: 5.0),
                      child: const Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "Adventure Record ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent,
                              fontSize: 16),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.timeline,
                            color: Colors.red,
                            size:
                                20, // Sesuaikan dengan ukuran ikon yang diinginkan
                          ),
                        )
                      ]))),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      height: Get.height / 3,
                      child: SingleChildScrollView(
                        child: Obx(() {
                          if (controller.listHistories.isNotEmpty) {
                            return Column(
                              children: controller.listHistories
                                  .map((el) => LastHisotryCard(data: el))
                                  .toList(),
                            );
                          }
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: Text(
                                "History Belum Tersedia",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ])));
  }
}
