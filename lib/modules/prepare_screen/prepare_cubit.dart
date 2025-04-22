import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/prepare_screen/prepare_model.dart';
import 'package:code_quest/modules/prepare_screen/prepare_state.dart';
import 'package:http/http.dart' as http;

import '../log_in_screen/login_cubit.dart';

class PrepareCubit extends Cubit<PrepareState> {
  static int prepareId=0;
  PrepareCubit() : super(PrepareInitial());
  List<PrepareModel> perpare = [];
  Future<void> courseProcess() async {
    emit(PrepareLoading());
    var response = await http.get(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/enrolled?userId=${LoginCubit.userId}",
      ),
    );
    if (response.statusCode == 200) {
      perpare = prepareModelFromJson(response.body);
      print("prepare" + perpare.toString());
      emit(PrepareLoaded(coursePrepare: perpare));
      print("Cubit Success");
    } else {
      print("Cubit Failure");

      emit(PrepareFailuer(error: "Failed to load courses"));
    }
  }
}
