import 'package:flutter/material.dart';
import 'dart:convert';
List<QuizesModel> QuizesModelFromJson(String str) => List<QuizesModel>.from(
  json.decode(str).map((x) => QuizesModel.fromJson(x)),
);

String QuizesModelToJson(List<QuizesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class QuizesModel {
  final int quizId;
  final String question;
  final String code;
  final List<String> answer;
  final String correct_answer;

  QuizesModel({
    required this.question,
    required this.answer,
    required this.correct_answer,
    required this.quizId,
    required this.code,
  });
  factory QuizesModel.fromJson(Map<String, dynamic> json) => QuizesModel(
    question: json["progress"],
    answer: json["answer"],
    correct_answer: json["correct_answer"],
    quizId: json["quizId"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
    "correct_answer": correct_answer,
    "quizId": quizId,
    "code": code,
  };
}
