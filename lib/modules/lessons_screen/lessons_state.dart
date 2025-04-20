import 'lessons_model.dart';

sealed class LessonsState {}

final class LessonsInitial extends LessonsState {}

final class LessonsLoading extends LessonsState {}

final class LessonsIncCounter extends LessonsState {}

final class LessonsDecCounter extends LessonsState {}

final class LessonsLoaded extends LessonsState {

}

final class LessonsFailure extends LessonsState {
  final String error;
  LessonsFailure({required this.error});
}
