import 'package:code_quest/modules/paython_course/python_models/python_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class pythonProvider with ChangeNotifier {
  String pythomUrl = "";

  Future<List<pythonModel>?> courseProcess() async {
    var response = await http.get(pythomUrl as Uri);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List<pythonModel> course = [];
      for (var course in body) {
        course.add(pythonModel.fromJson(course));
      }

      return course;
    } else {
      print(response.statusCode);
    }
    return null;
    notifyListeners();
  }
}
