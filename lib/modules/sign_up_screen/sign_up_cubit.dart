import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/log_in_screen/login_cubit.dart';
import 'package:code_quest/modules/sign_up_screen/model/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../authentaction_model/auth_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController birthController = TextEditingController();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isMale = false;
  bool isFemale = false;
  final dio = Dio();
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChanged(isPasswordVisible));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ConfirmPasswordVisibilityChanged(isConfirmPasswordVisible));
  }

  void setGender(bool isMaleSelected) {
    isMale = isMaleSelected;
    isFemale = !isMaleSelected;
    emit(GenderChanged(isMale: isMale, isFemale: isFemale));
  }

  void signUp(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        emit(SignUpLoading());
        final response= await dio.post(
          "https://usermanagement-codequst-5a2d223458b5.herokuapp.com/auth/register",
          data: {
            "firstName": firstNameController.text,
            "lastName": lastNameController.text,
            "email": emailController.text,
            "phoneNum": phoneController.text,
            "password": passwordController.text,
            "birthDate": birthController.text,
            "gender": isMale ? "male" : "female",
          },
        );
        if (response.statusCode == 200) {
          print(response.data);
          if(response.data["message"].toString().contains("OTP sent!")){
            emit(SignUpSuccess());
          }
          print("Success");
        } else if (response.statusCode == 401) {
          emit(SignUpFailure("Invalid phone number or password"));
          print("Failure");
        } else {
          emit(SignUpFailure("Something went wrong"));
        }
      }
    } catch (e,t) {
      emit(SignUpFailure(e.toString()));
      print(t);
    }
  }

  void verfiyOtp(BuildContext context, String email, String otp) async {
    try {
      final response = await dio.post(
        "https://usermanagement-codequst-5a2d223458b5.herokuapp.com/auth/verify-otp",
        queryParameters: {"email": email, "otp": otp},
      );
      if (response.statusCode == 200) {
        print(response.data);
        AuthModel userData= authModelFromJson(response.data as Map<String,dynamic>);
        LoginCubit.userId= userData.userId;
        print(response.data);
        emit(VerfiyOtpSuccess());
      }
    } catch (e) {
      emit(VerfiyOtpFailure(e.toString()));
    }
  }
}
