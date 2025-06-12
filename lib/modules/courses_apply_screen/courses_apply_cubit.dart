import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/courses_apply_screen/courses_apply_model.dart';
import 'package:http/http.dart' as http;
import '../log_in_screen/login_cubit.dart';
import 'courses_apply_state.dart';

class CoursesApplyCubit extends Cubit<CoursesApplyState> {

  CoursesApplyCubit() : super(CoursesApplyInitial());
  static List<CoursesApplyModel> apply = [];
  static int enrolledCourse=-1;

  Future<void> enrollProcess ()async{
    emit(CoursesApplyLoading());
    var send = await http.post(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/${enrolledCourse}/enroll?userId=${LoginCubit.userId}",
      ),
    );
    print(send.body);
    if(send.statusCode==200){
      emit(CoursesApplySucces());
    }else{
      emit(CoursesApplyFailure(error: "error while sending"));
    }
  }

  Future<void> courseApplyProcess() async {
    emit(CoursesApplyLoading());
    var response = await http.get(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses",
      ),
    );
    if (response.statusCode == 200) {
      apply = CoursesApplyFromJson(response.body);
      print("courses" + apply.toString());
      emit(CoursesApplyloaded());
      print("Cubit Success");
    } else {
      print("Cubit Failure");
      emit(CoursesApplyFailure(error: "Failed to load courses"));
    }
  }
}
