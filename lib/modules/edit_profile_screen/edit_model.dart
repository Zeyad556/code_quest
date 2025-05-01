import 'dart:convert';

EditModel EditModelFromJson(String str) => EditModel.fromJson(json.decode(str));

String editModelToJson(EditModel data) => json.encode(data.toJson());

class EditModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String newPhoneNum;
  String birthDate;

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
    birthDate: json["birthDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "newPhoneNum": newPhoneNum,
    "birthDate": birthDate,
  };
}
