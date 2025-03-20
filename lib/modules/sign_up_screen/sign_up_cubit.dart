import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/sign_up_screen/model/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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

  void signUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Perform sign-up logic here

      emit(SignUpLoading());
      dio.post(
        "https://usermangment-codequest-0fbfa624afb1.herokuapp.com/auth/register",
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
    }
  }
}
