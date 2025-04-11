import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'python_course_state.dart';

class PythonCourseCubit extends Cubit<PythonCourseState> {
  PythonCourseCubit() : super(PythonCourseInitial());
}
