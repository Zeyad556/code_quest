import 'package:code_quest/modules/paython_course/paython_course_screen.dart';
import 'package:code_quest/modules/paython_course/python_course_cubit.dart';
import 'package:code_quest/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrepareScreen extends StatelessWidget {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20.0,
                  end: 180.0,
                ),
                child: Text(
                  'Your Preparation',
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 15.0.h),
              Center(
                child: Container(
                  width: 360.w,
                  height: 270.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 50.0,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80.w,
                        ), // Creates space for the floating image
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 250.0),
                          child: Text(
                            'Python',
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Slider(
                          value: progress,
                          min: 0,
                          max: 100,
                          divisions: 100,
                          label:
                              "${progress.toInt()}", // Show tooltip with value
                          activeColor: Colors.deepPurple,
                          onChanged: (value) {
                            progress = value;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            "${progress.toInt()}% Get to 48 points to unlock this badge", // Display progress percentage
                            style: TextStyle(
                              fontSize: 17.6.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10),
                          child: Container(
                            width: 200.w,
                            height: 40.h,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<PythonCourseCubit>().courseProcess(
                                  10,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaythonCourseScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Continue Preparation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            width: 140.w,
            height: 140.h,
            top: -5, // Adjust this value to move the image up
            right: 5, // Positioning for the left side
            child: CircleAvatar(
              radius: 5, // Adjust the size
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/paython_logo.png',
                  width: 140.w,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
