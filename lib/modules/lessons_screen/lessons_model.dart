// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

List<LessonsModel> LessonFromJson(String str) =>
    List<LessonsModel>.from(json.decode(str).map((x) => LessonsModel.fromJson(x)));

String LessonToJson(List<LessonsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonsModel {
  int id;
  String title;
  String content;
  String? barTitle;

  LessonsModel({required this.id, required this.title, required this.content ,this.barTitle});

  factory LessonsModel.fromJson(Map<String, dynamic> json) =>
      LessonsModel(id: json["id"], title: json["title"], content: json["content"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
  };
}
