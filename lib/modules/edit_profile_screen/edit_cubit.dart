import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/edit_profile_screen/edit_model.dart';
import 'package:code_quest/modules/profile_screen/profile_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());
  Future<void> editProfile(ProfileModel model) async {
    try {
      emit(EditLoading());
      var response = await http.put(
        body: profileModelToJson(model),
        headers: {
          "Content-Type" : "application/json"
        },
        Uri.parse(
          "https://usermanagement-codequst-5a2d223458b5.herokuapp.com/auth/profile/edit",
        ),
      );
      if (response.statusCode == 200) {
        print(response.body);
        emit(EditSuccess());
      } else {
        print(response.body);
        emit(EditFauiler(error: response.body));
      }
    } catch (e) {
      print(e);
      emit(EditFauiler(error: e.toString()));
    }
  }
}
