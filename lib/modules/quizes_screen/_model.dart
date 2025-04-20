// To parse this JSON data, do
//
//     final sendScore = sendScoreFromJson(jsonString);

import 'dart:convert';

SendScore sendScoreFromJson(String str) => SendScore.fromJson(json.decode(str));

String sendScoreToJson(SendScore data) => json.encode(data.toJson());

class SendScore {
  int userId;
  int lessonId;
  List<String> selectedAnswers;

  SendScore({
    required this.userId,
    required this.lessonId,
    required this.selectedAnswers,
  });

  factory SendScore.fromJson(Map<String, dynamic> json) => SendScore(
    userId: json["userId"],
    lessonId: json["lessonId"],
    selectedAnswers: List<String>.from(json["selectedAnswers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "lessonId": lessonId,
    "selectedAnswers": List<dynamic>.from(selectedAnswers.map((x) => x)),
  };
}