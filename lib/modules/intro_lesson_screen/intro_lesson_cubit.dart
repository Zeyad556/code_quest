import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro_lesson_state.dart';

class IntroLessonCubit extends Cubit<IntroLessonState> {
  IntroLessonCubit() : super(IntroLessonInitial());
}
