import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:code_quest/modules/authentaction_model/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final dio = Dio();
  static int userId=0;
  void login(String phone, String password) async {
    try {
      emit(LoginLoading());
      final response = await dio.post(
        "https://usermanagement-codequst-5a2d223458b5.herokuapp.com/auth/login",
        data: {"phoneNum": phone, "password": password},
      );
      if (response.statusCode == 200) {
        AuthModel userData= authModelFromJson(response.data as Map<String,dynamic>);
        userId= userData.userId;
        print(response.data);
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
