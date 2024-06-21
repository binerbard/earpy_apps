import 'dart:convert';

MoodTrackReqModel moodTrackReqModelFromJson(String str) {
  final jsonData = json.decode(str);
  return MoodTrackReqModel.fromJson(jsonData);
}

String moodTrackReqModelToJson(MoodTrackReqModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class MoodTrackReqModel {
  String id;
  String number;
  String date;
  String? emoji;
  String? content;

  MoodTrackReqModel({
    required this.id,
    required this.number,
    required this.date,
    this.content,
    this.emoji,
  });

  factory MoodTrackReqModel.fromJson(Map<String, dynamic> json) {
    return MoodTrackReqModel(
      id: json['id'] as String,
      number: json['number'] as String,
      date: json['date'] as String,
      content: json['content'] as String?,
      emoji: json['emoji'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'date': date,
      'content': content,
      'emoji': emoji,
    };
  }
}
