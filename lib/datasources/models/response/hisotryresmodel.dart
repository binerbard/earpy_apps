import "./../request/historyreqmodel.dart";

class HistoryResModel {
  List<HistoryModel> listHistories;
  int countHistory;

  HistoryResModel({required this.listHistories, required this.countHistory});

  factory HistoryResModel.fromJson(Map<String, dynamic> json) =>
      HistoryResModel(
        listHistories: List<HistoryModel>.from(
            json["listHistories"].map((x) => HistoryModel.fromJson(x))),
        countHistory: json["countHistory"],
      );

  Map<String, dynamic> toJson() => {
        "listHistories":
            List<dynamic>.from(listHistories.map((x) => x.toJson())),
        "countHistory": countHistory,
      };
}
