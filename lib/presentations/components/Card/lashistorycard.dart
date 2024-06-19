import 'package:earpy_app/datasources/models/request/historyreqmodel.dart';
import 'package:flutter/material.dart';

class LastHisotryCard extends StatelessWidget {
  final HistoryModel data;
  const LastHisotryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.pinkAccent),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: ListTile(
        trailing: Column(
          children: [
            const Icon(
              Icons.watch_later_outlined,
              color: Colors.pinkAccent,
            ),
            Text(data.duration)
          ],
        ),
        leading: Column(
          children: [
            Text(
              data.month,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const Icon(Icons.calendar_month_outlined),
          ],
        ),
        subtitle: Text(
            "(${data.startTime} - ${data.endTime})\n${data.day} ${data.dayperiod}"),
        title: Text(
          data.date,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
