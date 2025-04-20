import 'package:flutter/foundation.dart';
import 'quizes_model.dart';

@immutable
abstract class QuizzesState {}

class QuizzesInitial extends QuizzesState {}

class QuizzesLoading extends QuizzesState {}

class QuizzesLoaded extends QuizzesState {}
class QuizzesSuccess extends QuizzesState {}

class QuizzesInc extends QuizzesState {}

class QuizzesDec extends QuizzesState {}

class QuizzesFailure extends QuizzesState {
  final String error;
  QuizzesFailure({required this.error});
}
