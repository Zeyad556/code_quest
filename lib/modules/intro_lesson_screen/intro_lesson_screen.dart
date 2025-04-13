import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../profile_screen/profile_cubit.dart';
import '../profile_screen/profile_screen.dart';
import 'Intro_model.dart';

class IntroLessonScreen extends StatelessWidget {
  IntroLessonScreen({super.key});
  final List<String> answers = ['A) 1991', 'B) 1985', 'C) 1993', 'D) 1999'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 80.0.h,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(top: 40.0),
          child: Row(
            children: [
              Text(
                "CodeQuest",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25.0.sp,
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 50.0, end: 5.0),
            child: IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white, size: 40),
              onPressed: () {
                context.read<ProfileCubit>().getProfileData("01170911564");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          // Wrap entire body in SingleChildScrollView
          child: Column(
            children: [
              Container(
                width: double.infinity.w,
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                  border: Border.all(
                    color: Colors.black, // Outline color
                    width: 1.2.w, // Thickness of the outline
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Python . Introduction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 150),
                child: Text(
                  "What is Python?",
                  style: TextStyle(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: Container(
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 380),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: SizedBox(
                        width: 120.w,
                        height: 35.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "<  Back",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.deepPurple,
                              width: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 110),
                      child: SizedBox(
                        width: 120.w,
                        height: 35.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Next  >",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              // Replaced Expanded with ListView without wrapping inside an Expanded
              ListView.builder(
                shrinkWrap:
                    true, // Allows ListView to take only necessary space
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 5,horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(answers[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
