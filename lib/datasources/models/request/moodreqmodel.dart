import 'dart:convert';

MoodTrack moodTrackFromJson(String str) {
  final jsonData = json.decode(str);
  return MoodTrack.fromJson(jsonData);
}

String moodTrackToJson(MoodTrack data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class MoodTrack {
  String id;
  String date;
  String emoji;
  String content;

  MoodTrack({
    required this.id,
    required this.date,
    required this.content,
    required this.emoji,
  });

  factory MoodTrack.fromJson(Map<String, dynamic> json) {
    return MoodTrack(
      id: json['id'] as String,
      date: json['date'] as String,
      content: json['content'] as String,
      emoji: json['dayperiod'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'content': content,
      'emoji': emoji,
    };
  }
}
