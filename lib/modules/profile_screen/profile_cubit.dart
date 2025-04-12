import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/profile_screen/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  List<ProfileModel> data = [];
  void Data(String name,String email,String phone,String birth) async{
      emit(ProfileLoading());
      final response = await http.get(Uri.parse("https://usermanagement-codequst-5a2d223458b5.herokuapp.com/auth/profile/${phone}")
      );
      if (response.statusCode == 200){
        data = ProfileModelFromJson(response.body);
        print("courses" + data.toString());
        emit(ProfileLoaded(profileData: data));
        print("Cubit Success");
      } else {
        print("Cubit Failure");

        emit(ProfileFailure(error: "Failed to load courses"));
      }
      }
    }


