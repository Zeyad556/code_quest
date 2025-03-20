import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final dio = Dio();
  void login(String phone, String password) async {
    try {
      emit(LoginLoading());
      final response = await dio.post(
        "https://usermangment-codequest-0fbfa624afb1.herokuapp.com/auth/login",
        data: {"phoneNum": phone, "password": password},
      );
      if (response.statusCode == 200) {
        emit(LoginSuccess());
        print("Success");
      } else if (response.statusCode == 401) {
        emit(LoginFailure("Invalid phone number or password"));
        print("Failure");
      } else {
        emit(LoginFailure("Something went wrong"));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
