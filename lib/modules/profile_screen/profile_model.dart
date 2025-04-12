// To parse this JSON data, do
//
//     final pythonModel = pythonModelFromJson(jsonString);
import 'dart:convert';

List<ProfileModel> ProfileModelFromJson(String str) => List<ProfileModel>.from(
  json.decode(str).map((x) => ProfileModel.fromJson(x)),
);

String ProfileModelToJson(List<ProfileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileModel {
  String name;
  String email;
  String phone;
  String birth;
  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.birth,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    birth: json["birth"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "birth": birth,
  };
}
