import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/lessons_screen/lessons_state.dart';
import 'package:code_quest/modules/paython_course/python_course_cubit.dart';
import 'package:code_quest/modules/quizes_screen/quizes_model.dart';
import 'package:code_quest/modules/quizes_screen/quizes_state.dart';
import 'package:http/http.dart' as http;

class QuizzesCubit extends Cubit<QuizzesState> {
  List<Char>? selectedAnswers;
  int questionIndex = 0;
  QuizzesCubit() : super(QuizzesInitial());
  List<QuizesModel> quiz = [];
  Future<void> QuizProcess() async {
    emit(QuizzesLoading());
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
    emit(QuizzesLoading());
    var response = await http.post(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/submit-quiz",
      ),
      body: {
        "userId": 19,
        "lessonId": PythonCourseCubit.num,
        "selectedAnswers": selectedAnswers,
      },
    );
    if (response.statusCode == 200) {
      if (response.body == "Quiz evaluated successfully.") {
        emit(QuizzesSuccess());
      }
    } else {
      print("Cubit Failure");

      emit(QuizzesFailure(error: "Failed to load courses"));
    }
  }
}
