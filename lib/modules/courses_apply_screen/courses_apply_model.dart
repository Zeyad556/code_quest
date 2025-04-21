import 'dart:convert';

List<CoursesApplyModel> CoursesApplyFromJson(String str) => List<CoursesApplyModel>.from(json.decode(str).map((x) => CoursesApplyModel.fromJson(x)));

String CoursesApplyToJson(List<CoursesApplyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesApplyModel {
  int id;
  String title;
  CoursesApplyModel({
    required this.id,
    required this.title,
  });

  factory CoursesApplyModel.fromJson(Map<String, dynamic> json) => CoursesApplyModel(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
