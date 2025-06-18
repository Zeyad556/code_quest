// To parse this JSON data, do
//
//     final pythonModel = pythonModelFromJson(jsonString);
import 'dart:convert';
List<PythonModel> pythonModelFromJson(String str) => List<PythonModel>.from(
  json.decode(str).map((x) => PythonModel.fromJson(x)),
);
String pythonModelToJson(List<PythonModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class PythonModel {
  bool progress;
  double rate;
  bool status;
  String title;
  int Id;
  PythonModel({
    required this.progress,
    required this.rate,
    required this.status,
    required this.title,
    required this.Id,
  });
  factory PythonModel.fromJson(Map<String, dynamic> json) => PythonModel(
    progress: json["progress"],
    rate: json["rate"],
    status: json["status"],
    title: json["title"],
    Id: json["id"],
  );
  Map<String, dynamic> toJson() => {
    "progress": progress,
    "rate": rate,
    "status": status,
    "title": title,
    "id": Id,
  };
}
