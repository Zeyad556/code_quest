import 'dart:convert';

List<PrepareModel> prepareModelFromJson(String str) => List<PrepareModel>.from(json.decode(str).map((x) => PrepareModel.fromJson(x)));

String prepareModelToJson(List<PrepareModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrepareModel {
  int id;
  String title;
  double takenLessons;

  PrepareModel({
    required this.id,
    required this.title,
    required this.takenLessons,
  });

  factory PrepareModel.fromJson(Map<String, dynamic> json) => PrepareModel(
    id: json["id"],
    title: json["title"],
    takenLessons: json["takenLessons"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "takenLessons": takenLessons,
  };
}