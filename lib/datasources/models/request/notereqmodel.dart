import 'dart:convert';

NoteModel noteModelFromJson(String str) {
  final jsonData = json.decode(str);
  return NoteModel.fromJson(jsonData);
}

String historyModelToJson(NoteModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class NoteModel {
  String id;
  String title;
  String content;

  NoteModel({required this.id, required this.title, required this.content});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
