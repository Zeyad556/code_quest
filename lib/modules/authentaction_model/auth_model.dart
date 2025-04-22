// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(Map<String,dynamic> str) => AuthModel.fromJson(str);

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  int userId;
  String message;

  AuthModel({
    required this.userId,
    required this.message,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    userId: json["userId"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "message": message,
  };
}