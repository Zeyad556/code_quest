import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/lessons_screen/lessons_model.dart';
import 'package:code_quest/modules/lessons_screen/lessons_state.dart';
import 'package:code_quest/modules/paython_course/python_course_cubit.dart';
import 'package:code_quest/modules/paython_course/python_models/python_model.dart';
import 'package:http/http.dart' as http;


class LessonsCubit extends Cubit<LessonsState> {
  int counter=0;
  LessonsCubit() : super(LessonsInitial()){
    courseProcess();
  }
  List<LessonsModel> lesson = [];
  Future<void> courseProcess() async {
    emit(LessonsLoading());
    var response = await http.get(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/lessons/${PythonCourseCubit.num}/sections",
      ),
    );
    if (response.statusCode == 200) {
      lesson = LessonFromJson(response.body);
      print(response.body);
      print(lesson[0].title);
      print("courses" + lesson.toString());
      emit(LessonsLoaded());
      print("Cubit Success");
    } else {
      print("Cubit Failure");

      emit(LessonsFailure(error: "Failed to load courses"));
    }
  }
  void IncCounter(){
    counter++;
    emit(LessonsIncCounter());
    emit(LessonsLoaded());
  }
  void DecCounter(){
    counter--;
    emit(LessonsDecCounter());
    emit(LessonsLoaded());
  }
}
