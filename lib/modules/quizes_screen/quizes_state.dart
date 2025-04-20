// quizes_state.dart
import 'package:flutter/foundation.dart';
import 'quizes_model.dart';

@immutable
abstract class QuizesState {}

class QuizesInitial extends QuizesState {}

class QuizesLoading extends QuizesState {}

class QuizesLoaded extends QuizesState {
  final List<QuizesModel> quizes;

  QuizesLoaded(this.quizes);
}

class QuizesFailure extends QuizesState {
  final String error;

  QuizesFailure({required this.error});
}
