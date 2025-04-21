import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/courses_apply_screen/courses_apply_model.dart';
import 'package:http/http.dart' as http;
import 'courses_apply_state.dart';

class CoursesApplyCubit extends Cubit<CoursesApplyState> {

  CoursesApplyCubit() : super(CoursesApplyInitial());
  List<CoursesApplyModel> apply = [];

  Future<void> courseApplyProcess(CoursesApplyModel id) async {
    emit(CoursesApplyLoading());
    var response = await http.get(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses",
      ),
    );
    var send = await http.post(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/${id}/enroll?userId=20",
      ),
    );
    if (response.statusCode == 200) {
      apply = CoursesApplyFromJson(response.body);
      print("courses" + apply.toString());
      emit(CoursesApplyloaded(apply: apply));
      print("Cubit Success");
    } else {
      print("Cubit Failure");
      emit(CoursesApplyFailure(error: "Failed to load courses"));
    }
  }
}
