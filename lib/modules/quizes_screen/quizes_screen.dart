import 'package:code_quest/cherryToast/CherryToastMsgs.dart';
import 'package:code_quest/modules/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:code_quest/modules/quizes_screen/quizes_cubit.dart';
import 'package:code_quest/modules/quizes_screen/quizes_state.dart';

import '../python_course/paython_course_screen.dart';

class QuizesScreen extends StatefulWidget {
  @override
  State<QuizesScreen> createState() => _QuizesScreenState();
}

class _QuizesScreenState extends State<QuizesScreen> {
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    context.read<QuizzesCubit>().QuizProcess();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizzesCubit()..QuizProcess(),
      child: Scaffold(
        backgroundColor: Color(0xFFF1EAFF),
        body: BlocConsumer<QuizzesCubit, QuizzesState>(
          listener: (context, state) {
            if (state is QuizzesScoreLoading) {
              CherryToastMsgs.CherryToastVerified(
                context: context,
                title: "Quiz",
                description: "Now for your result",
              ).show(context);
            }
            if (state is QuizzesSuccess) {
              CherryToastMsgs.CherryToastSuccess(
                context: context,
                title: "Quiz",
                description: "Good Job!!",
              ).show(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(index: 1,)),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            final questions = context.read<QuizzesCubit>();
            if (state is QuizzesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QuizzesLoaded) {
              final quizzes = questions.quiz;
              final currentQuiz = quizzes[questions.questionIndex];
              print(currentQuiz.question);
              print(questions.questionIndex);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Top bar with title
                    Container(
                      width: double.infinity.w,
                      height: 100.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFAA60C8),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.black, width: 1.2.w),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 40),
                        child: Center(
                          child: Text(
                            "python intro",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    Container(
                      width: 350.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        currentQuiz.question,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // Optional Code Container
                    if (currentQuiz.code != null &&
                        currentQuiz.code.toString().trim().isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 350.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              currentQuiz.code.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 20.h),
                    // Answers
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: currentQuiz.answer.length,
                      itemBuilder: (context, index) {
                        final answer = currentQuiz.answer[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: RadioListTile<String>(
                            value: answer,
                            groupValue: selectedAnswer,
                            onChanged: (String? value) {
                              setState(() {
                                selectedAnswer = value;
                              });
                            },
                            title: Text(
                              answer,
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color:
                                    selectedAnswer == answer
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                            activeColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            tileColor:
                                selectedAnswer == answer
                                    ? Color.fromARGB(200, 65, 8, 70)
                                    : Color(0xFFAA60C8),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: -20,
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 110,
                      ),
                      child: SizedBox(
                        height: 40.h,
                        child: ElevatedButton(
                          //total page , correct answer
                          onPressed: () {
                            final state = context.read<QuizzesCubit>().state;
                            if (state is QuizzesLoaded) {
                              if (selectedAnswer != null) {
                                questions.selectedAnswers?.add(
                                  selectedAnswer![0],
                                );
                                if (questions.quiz.length - 1 ==
                                    questions.questionIndex) {
                                  questions.call();
                                } else {
                                  print(questions.questionIndex);
                                  print(selectedAnswer);
                                  questions.IncCounter();
                                }
                                selectedAnswer = null;
                                print(questions.selectedAnswers);
                              }
                            }
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD69ADE),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is QuizzesFailure) {
              return Center(
                child: Text("Failed to load quizzes: ${state.error}"),
              );
            } else {
              return Center(child: Text("Welcome to the Quiz!"));
            }
          },
        ),
      ),
    );
  }
}
