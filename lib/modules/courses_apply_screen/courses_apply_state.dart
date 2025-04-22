import 'package:code_quest/modules/courses_apply_screen/courses_apply_model.dart';

sealed class CoursesApplyState {}

final class CoursesApplyInitial extends CoursesApplyState {}

final class CoursesApplyLoading extends CoursesApplyState {}

final class CoursesApplySucces extends CoursesApplyState {}

final class CoursesApplyloaded extends CoursesApplyState {
}

final class CoursesApplyFailure extends CoursesApplyState {
  final String error;
  CoursesApplyFailure({required this.error});
}
