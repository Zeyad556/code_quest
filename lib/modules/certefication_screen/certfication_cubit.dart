import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/certefication_screen/certfications_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../log_in_screen/login_cubit.dart';

part 'certfication_state.dart';

class CertficationCubit extends Cubit<CertficationState> {

  CertficationCubit() : super(CerteficationInitial()) {
    certificateProcess();
  }

  List<CerteficationModel> Certefication = [];

  Future<void> certificateProcess() async {
    emit(CerteficationLoading());
    var response = await http.get(
      Uri.parse(
        "https://course-codequest-215c3c02f593.herokuapp.com/api/courses/certificates/${LoginCubit.userId}",
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      Certefication = CerteficationFromJson(response.body);
      print(Certefication[0].courseTitle);
      print("courses" + Certefication.toString());
      emit(CerteficationLoaded(Certefication));
      print("Cubit Success");
    } else {
      print("Cubit Failure");

      emit(CerteficationFailure(error: "Failed to load your certificates"));
    }
  }
}
