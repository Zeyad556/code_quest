import 'dart:convert';

EditModel EditModelFromJson(String str) => EditModel.fromJson(json.decode(str));

String editModelToJson(EditModel data) => json.encode(data.toJson());

class EditModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String newPhoneNum;
  DateTime birthDate;

  EditModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.newPhoneNum,
    required this.birthDate,
  });

  factory EditModel.fromJson(Map<String, dynamic> json) => EditModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    newPhoneNum: json["newPhoneNum"],
    birthDate: DateTime.parse(json["birthDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "newPhoneNum": newPhoneNum,
    "birthDate":
        "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
  };
}
