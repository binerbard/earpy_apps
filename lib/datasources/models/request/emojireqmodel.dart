import 'dart:convert';

EmojiModel emojiModelFromJson(String str) {
  final jsonData = json.decode(str);
  return EmojiModel.fromJson(jsonData);
}

String emojiModelToJson(EmojiModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class EmojiModel {
  String id;
  String emoji;

  EmojiModel({
    required this.id,
    required this.emoji,
  });

  factory EmojiModel.fromJson(Map<String, dynamic> json) {
    return EmojiModel(
      id: json['id'] as String,
      emoji: json['dayperiod'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'emoji': emoji,
    };
  }
}
