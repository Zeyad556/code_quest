import 'dart:convert';

List<CerteficationModel> CerteficationFromJson(String str) =>
    List<CerteficationModel>.from(
      json.decode(str).map((x) => CerteficationModel.fromJson(x)),
    );

String CerteficationToJson(List<CerteficationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CerteficationModel {
  int id;
  String courseTitle;

  CerteficationModel({required this.id, required this.courseTitle});

  factory CerteficationModel.fromJson(Map<String, dynamic> json) =>
      CerteficationModel(id: json["id"], courseTitle: json["courseTitle"]);

  Map<String, dynamic> toJson() => {"id": id, "courseTitle": courseTitle};
}
