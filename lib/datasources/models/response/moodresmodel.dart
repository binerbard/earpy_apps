import '../request/moodreqmodel.dart';

class MoodTrackResModel {
  List<MoodTrackReqModel> listMoodTrack;
  int year;
  int month;
  MoodTrackResModel(
      {required this.listMoodTrack, required this.year, required this.month});

  factory MoodTrackResModel.fromJson(Map<String, dynamic> json) =>
      MoodTrackResModel(
        listMoodTrack: List<MoodTrackReqModel>.from(
            json["listMoodTrack"].map((x) => MoodTrackReqModel.fromJson(x))),
        year: json["year"],
        month: json["month"],
      );

  Map<String, dynamic> toJson() => {
        "listMoodTrack":
            List<dynamic>.from(listMoodTrack.map((x) => x.toJson())),
        "year": year,
        "month": month,
      };
}
