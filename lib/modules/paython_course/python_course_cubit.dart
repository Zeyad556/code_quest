import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/paython_course/python_models/python_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'python_course_state.dart';

class PythonCourseCubit extends Cubit<PythonCourseState> {
  PythonCourseCubit() : super(PythonCourseInitial());

  Future<void> courseProcess(int CourseId) async {
    emit(PythonCourseLoading());
    var response = await http.get(Uri.parse("http://13.60.68.166:5000"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List<pythonModel> course = [];
      for (var course in body) {
        course.add(pythonModel.fromJson(course));
      }
      emit(PythonCourseLoaded(courses: course));
    } else {
      emit(PythonCourseFailure(error: "Failed to load courses"));
    }
  }
}
