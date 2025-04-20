// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<QuizesModel> QuizesModelFromJson(String str) =>
    List<QuizesModel>.from(json.decode(str).map((x) => QuizesModel.fromJson(x)));

String QuizesModelToJson(List<QuizesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizesModel {
  int quizId;
  String question;
  dynamic code;
  List<String> answer;

  QuizesModel({
    required this.quizId,
    required this.question,
    required this.code,
    required this.answer,
  });

  factory QuizesModel.fromJson(Map<String, dynamic> json) => QuizesModel(
    quizId: json["quizId"],
    question: json["question"],
    code: json["code"],
    answer: List<String>.from(json["answer"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "quizId": quizId,
    "question": question,
    "code": code,
    "answer": List<dynamic>.from(answer.map((x) => x)),
  };
}
