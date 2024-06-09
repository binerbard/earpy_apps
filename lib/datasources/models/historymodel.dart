import 'dart:convert';

HistoryModel historyModelFromJson(String str) {
  final jsonData = json.decode(str);
  return HistoryModel.fromJson(jsonData);
}

String historyModelToJson(HistoryModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class HistoryModel {
  String id;
  String date;
  String day;
  String month;
  String time;
  String duration;
  String? note;

  HistoryModel({
    required this.id,
    required this.date,
    required this.day,
    required this.month,
    required this.time,
    required this.duration,
    required this.note,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'] as String,
      date: json['date'] as String,
      day: json['day'] as String,
      month: json['month'] as String,
      time: json['time'] as String,
      duration: json['duration'] as String,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'day': day,
      'month': month,
      'time': time,
      'duration': duration,
      'note': note,
    };
  }
}
