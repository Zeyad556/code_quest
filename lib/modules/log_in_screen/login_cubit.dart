import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String phone, String password) async {
    emit(LoginLoading()); // Show loading indicator

    await Future.delayed(Duration(seconds: 2)); // Simulate network request

    if (phone == "1234567890" && password == "password123") {
      emit(LoginSuccess()); // Login successful
    } else {
      emit(LoginFailure("Invalid phone number or password")); // Login failed
    }
  }
}
