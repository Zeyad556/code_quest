import 'package:bloc/bloc.dart';
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
      emit(SignUpLoading());

      // Simulate an API call
      Future.delayed(Duration(seconds: 2), () {
        emit(SignUpSuccess());
        Navigator.pushReplacementNamed(context, '/home');
      });
    }
  }
}
