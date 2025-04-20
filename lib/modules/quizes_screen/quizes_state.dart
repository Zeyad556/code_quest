import 'package:flutter/foundation.dart';
import 'quizes_model.dart';

@immutable
abstract class QuizzesState {}

class QuizzesInitial extends QuizzesState {}

class QuizzesLoading extends QuizzesState {}

class QuizzesLoaded extends QuizzesState {
  final List<QuizesModel> quizzes;
  QuizzesLoaded({required this.quizzes});
}

class QuizzesFailure extends QuizzesState {
  final String error;
  QuizzesFailure({required this.error});
}
