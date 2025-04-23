part of 'python_course_cubit.dart';

@immutable
sealed class PythonCourseState {}

final class PythonCourseInitial extends PythonCourseState {}

final class PythonCourseLoading extends PythonCourseState {}

final class PythonCourseLoaded extends PythonCourseState {
  final List<PythonModel> courses;
  PythonCourseLoaded({required this.courses});
}

final class PythonCourseFailure extends PythonCourseState {
  final String error;
  PythonCourseFailure({required this.error});
}
