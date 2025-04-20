//
// import 'package:code_quest/modules/quizes_screen/quizes_model.dart';
// import 'package:code_quest/modules/quizes_screen/quizes_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class QuizCubit extends Cubit<QuizState> {
//   QuizCubit()
//       : super(QuizLoaded(
//     quiz: QuizesModel(
//       question: "When was Python created?",
//       answer: ['A) 1991', 'B) 1985', 'C) 1993', 'D) 1999'],
//       correctAnswer: 'A) 1991',
//     ),
//   ));
//
//   void selectAnswer(String answer) {
//     if (state is QuizLoaded) {
//       emit((state as QuizLoaded).copyWith(selectedAnswer: answer));
//     }
//   }
//
//   void submitAnswer() {
//     if (state is QuizLoaded) {
//       emit((state as QuizLoaded).copyWith(isSubmitted: true));
//     }
//   }
//
//   void resetQuiz() {
//     if (state is QuizLoaded) {
//       emit((state as QuizLoaded).copyWith(
//         selectedAnswer: null,
//         isSubmitted: false,
//       ));
//     }
//   }
// }
