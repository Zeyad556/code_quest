import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/lessons_screen/lessons_state.dart';
import 'package:code_quest/modules/paython_course/python_course_cubit.dart';
import 'package:code_quest/modules/quizes_screen/quizes_model.dart';
import 'package:code_quest/modules/quizes_screen/quizes_state.dart';
import 'package:http/http.dart' as http;

import '_model.dart';

class QuizzesCubit extends Cubit<QuizzesState> {
  List<String> selectedAnswers=[];
  int questionIndex = 0;
  QuizzesCubit() : super(QuizzesInitial());
  List<QuizesModel> quiz = [];
  Future<void> QuizProcess() async {
    emit(QuizzesLoading());
    var response = await http.get(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/lessons/${PythonCourseCubit.num}/quzzis",
      ),
    );
    if (response.statusCode == 200) {
      quiz = QuizesModelFromJson(response.body);
      print(response.body);
      print("Quizzes" + quiz.toString());
      emit(QuizzesLoaded());
      print("Cubit Success");
    } else {
      print("Cubit Failure");

      emit(QuizzesFailure(error: "Failed to load courses"));
    }
  }

  void IncCounter() {
    questionIndex++;
    emit(QuizzesInc());
    emit(QuizzesLoaded());
  }

  void DecCounter() {
    questionIndex--;
    emit(QuizzesDec());
    emit(QuizzesLoaded());
  }
  void call() async {
    print(selectedAnswers);
    emit(QuizzesScoreLoading());
    try{
      var response = await http.post(
        Uri.parse(
          "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/submit-quiz",
        ),
        headers: {"Content-Type" : "application/json"},
        body: sendScoreToJson(SendScore(userId: 19, lessonId: PythonCourseCubit.num, selectedAnswers: selectedAnswers))
      );
      print(response.body);////
      if (response.statusCode == 200) {
        if (response.body == "Quiz evaluated successfully.") {
          emit(QuizzesSuccess());
        }
      } else {
        print("Cubit Failure");

        emit(QuizzesFailure(error: "Failed to load courses"));
      }
    }catch(e,t){
      print(e);
      print(t);
    }

  }
}

