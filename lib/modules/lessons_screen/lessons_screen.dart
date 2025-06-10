import 'package:code_quest/modules/lessons_screen/lessons_cubit.dart';
import 'package:code_quest/modules/lessons_screen/lessons_state.dart';
import 'package:code_quest/modules/quizes_screen/quizes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../python_course/paython_course_screen.dart';
class LessonScreen extends StatefulWidget {
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  String text = "Python is a popular programming language.";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonsCubit>(
      create: (context) => LessonsCubit(),
      child: BlocConsumer<LessonsCubit, LessonsState>(
        builder: (context, state) {
          print(state);
          final lesson=context.read<LessonsCubit>();
          return Scaffold(
            backgroundColor: Color(0xFFF1EAFF),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                            "python.Intro",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 90),
                      child:
                          state is LessonsLoaded
                              ? Text(
                                lesson.lesson[lesson.counter].title,
                                style: TextStyle(
                                  fontSize: 27.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                              : CircularProgressIndicator(),
                    ),
                    SizedBox(height: 50.h),
                    Center(
                      child: Container(
                        width: 350.w,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              state is LessonsLoaded
                                  ? Text(
                                    lesson.lesson[lesson.counter].content,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                  : CircularProgressIndicator(),
                        ),
                      ),
                    ), // returns an invisible zero-sized widget
                    SizedBox(
                      height: 80.h,
                    ), // To avoid overlap with bottomNavigationBar
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 118.w,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        print(lesson.lesson.length);
                        print(lesson.counter);
                        if (state is LessonsLoaded){
                          if(lesson.counter==0){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaythonCourseScreen(),
                              ),
                            );
                          }else{
                            lesson.DecCounter();
                          }
                        }
                      },
                      child: Text(
                        "<  Back",
                        style: TextStyle(
                          color:  Color(0xFFD69ADE),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color:  Color(0xFFD69ADE), width: 4),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120.w,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        print(lesson.lesson.length);
                        print(lesson.counter);
                        if (state is LessonsLoaded){
                          if(lesson.lesson.length-1==lesson.counter){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizesScreen(),
                              ),
                            );
                          }else{
                            lesson.IncCounter();
                          }
                        }

                      },
                      child: Text(
                        "Next  >",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xFFD69ADE),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
