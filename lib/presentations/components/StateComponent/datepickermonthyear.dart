import 'package:earpy_app/presentations/components/Button/buttoninvert.dart';
import 'package:earpy_app/presentations/components/Decoration/listwheels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateDatePickerMonthYear extends StatelessWidget {
  final int thisYear;
  const StateDatePickerMonthYear({
    super.key,
    required this.thisYear,
  }) : assert(thisYear >= 0);

  int _yearLogic(int index) {
    return thisYear - index;
  }

  String _monthLogic(int index) {
    const List<String> months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
    return months[index];
  }

  @override
  Widget build(BuildContext context) {
    String yearResult = "";
    String monthResult = "";
    return AlertDialog(
      content: Container(
        height: Get.height * 0.6,
        width: Get.width * 0.8,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              "Select Month and Year",
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              DecorationListWheel(
                  onSelectedItemChanged: (p0) =>
                      yearResult = _yearLogic(p0).toString(),
                  childCount: 1000,
                  builder: (BuildContext context, int index) {
                    return SizedBox(
                        width: Get.width * 0.25,
                        child: Center(
                            child: Text(
                          "${_yearLogic(index)}",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )));
                  }),
              DecorationListWheel(
                  onSelectedItemChanged: (p0) => monthResult = _monthLogic(p0),
                  childCount: 12,
                  builder: (BuildContext context, int index) {
                    return SizedBox(
                        width: Get.width * 0.25,
                        child: Center(
                            child: Text(
                          _monthLogic(index),
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )));
                  })
            ]),
            SizedBox(
              height: Get.height * 0.05,
            ),
            ButtonTitleRadius(
                onTap: () {
                  yearResult =
                      yearResult.isEmpty ? thisYear.toString() : yearResult;
                  monthResult = monthResult.isEmpty ? "Januari" : monthResult;
                  Get.back(result: {"year": yearResult, "month": monthResult});
                },
                title: "Accept"),
            ButtonTitleRadius(
              onTap: () {
                Get.back();
              },
              title: "Cancel",
              invert: true,
            )
          ],
        ),
      ),
    );
  }
}
