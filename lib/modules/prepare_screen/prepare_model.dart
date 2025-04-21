import 'dart:convert';

List<PrepareModel> prepareModelFromJson(String str) => List<PrepareModel>.from(json.decode(str).map((x) => PrepareModel.fromJson(x)));

String prepareModelToJson(List<PrepareModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrepareModel {
  String title;
  double takenLessons;

  PrepareModel({
    required this.title,
    required this.takenLessons,
  });

  factory PrepareModel.fromJson(Map<String, dynamic> json) => PrepareModel(
    title: json["title"],
    takenLessons: json["takenLessons"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "takenLessons": takenLessons,
  };
}
