import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'quizes_model.dart';
import 'quizes_state.dart';

class QuizesCubit extends Cubit<QuizesState> {
  QuizesCubit() : super(QuizesInitial());

  final Dio _dio = Dio();

  Future<void> fetchQuizes() async {
    emit(QuizesLoading());
    try {
      final response = await _dio.get('https://course-codequest-215c3c02f593.herokuapp.com/api/courses/lessons/1/quzzis'); //api
      if (response.statusCode == 200) {
        final quizes = QuizesModelFromJson(jsonEncode(response.data));
        emit(QuizesLoaded(quizes));
      } else {
        print("Cubit Failure");
      }
    } catch (e) {
      emit(QuizesFailure(error: "Failed to load courses"));
    }
  }
}
