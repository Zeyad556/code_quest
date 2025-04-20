import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/quizes_screen/quizes_model.dart';
import 'package:code_quest/modules/quizes_screen/quizes_state.dart';
import 'package:http/http.dart' as http;


class QuizzesCubit extends Cubit<QuizzesState> {
  QuizzesCubit() : super(QuizzesInitial());
  List<QuizesModel> quiz = [];

  Future<void> QuizProcess() async {
    emit(QuizzesLoading());
    var response = await http.get(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/lessons/1/quzzis",
      ),
    );
    if (response.statusCode == 200) {
      quiz = QuizesModelFromJson(response.body);
      print("Quizzes" + quiz.toString());
      emit(QuizzesLoaded(quizzes: quiz));
      print("Cubit Success");
    } else {
      print("Cubit Failure");

      emit(QuizzesFailure(error: "Failed to load courses"));
    }
  }
}
