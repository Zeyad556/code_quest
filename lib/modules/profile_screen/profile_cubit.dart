import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/profile_screen/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import '../log_in_screen/login_cubit.dart';
import 'package:code_quest/network/local/cash_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


  Future<void> getProfileData() async {
    emit(ProfileLoading());
    try {
      var response = await http.get(
        Uri.parse(
          "https://usermanagement-codequst-5a2d223458b5.herokuapp.com/auth/profile/${LoginCubit.userId}",
        ),
      );
      if (response.statusCode == 200) {
        var jsonData = response.body;
        ProfileModel data = profileModelFromJson(jsonData);
        emit(ProfileLoaded(profileData: data));
        print("Cubit Success: ${response.body}");
      } else {
        emit(ProfileFailure(error: 'Failed to load profile data'));
        print("Cubit Failed: ${response.body}");
      }
    } catch (e) {
      emit(ProfileFailure(error: e.toString()));
    }
  }


  Future<void> logout() async {
    await CacheHelper.removeData(key: 'userId');
    emit(ProfileInitial());
  }
}
