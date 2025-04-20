import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/paython_course/python_models/python_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'python_course_state.dart';

class PythonCourseCubit extends Cubit<PythonCourseState> {
  static int num=0;
  PythonCourseCubit() : super(PythonCourseInitial());
  List<PythonModel> course = [];

  Future<void> courseProcess(int CourseId) async {
    emit(PythonCourseLoading());
    var response = await http.get(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/1/lessons/progress?userId=${CourseId}",
      ),
    );
    if (response.statusCode == 200) {
      course = pythonModelFromJson(response.body);
      print("courses" + course.toString());
      emit(PythonCourseLoaded(courses: course));
      print("Cubit Success");
    } else {
      print("Cubit Failure");

      emit(PythonCourseFailure(error: "Failed to load courses"));
    }
  }
}
