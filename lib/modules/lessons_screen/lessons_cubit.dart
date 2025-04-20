import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(LessonsInitial());
}
