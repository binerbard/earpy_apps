import "./../request/notereqmodel.dart";

class NoteResModel {
  List<NoteModel> listNotes;
  int countNote;

  NoteResModel({required this.listNotes, required this.countNote});

  factory NoteResModel.fromJson(Map<String, dynamic> json) => NoteResModel(
        listNotes: List<NoteModel>.from(
            json["listNotes"].map((x) => NoteModel.fromJson(x))),
        countNote: json["countNote"],
      );

  Map<String, dynamic> toJson() => {
        "listNotes": List<dynamic>.from(listNotes.map((x) => x.toJson())),
        "countNote": countNote,
      };
}
