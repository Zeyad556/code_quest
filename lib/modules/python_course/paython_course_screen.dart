import 'package:code_quest/modules/profile_screen/profile_cubit.dart';
import 'package:code_quest/modules/python_course/python_course_cubit.dart';
import 'package:code_quest/modules/python_course/python_models/python_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../lessons_screen/lessons_screen.dart';
import '../profile_screen/profile_screen.dart';
class PaythonCourseScreen extends StatefulWidget {
  @override
  State<PaythonCourseScreen> createState() => _PaythonCourseScreenState();
}

class _PaythonCourseScreenState extends State<PaythonCourseScreen> {
  @override

  void initState(){
    context.read<PythonCourseCubit>().courseProcess();
    super.initState();

  }
  Color getStateColor(bool state) {
    return state ? Colors.green: Colors.red;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EAFF),
      appBar: AppBar(
        actionsIconTheme: IconThemeData(
          color: Colors.grey
      ),
          backgroundColor: Color(0xFFAA60C8),
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
                context.read<ProfileCubit>().getProfileData();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<PythonCourseCubit, PythonCourseState>(
        builder: (context, state) {
          print("State: $state");
          if (state is PythonCourseLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PythonCourseLoaded) {
            return SizedBox(
              width: double.infinity.w,
              height: double.infinity.h,
              child: Column(
                children: [
                  Container(
                    width: double.infinity.w,
                    height: 70.h,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color:Color(0xFFAA60C8),
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
                        "Python Course",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) {
                        return buildCourseItem(state.courses[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is PythonCourseFailure) {
            return Center(
              child: Text('Failed to load courses: ${state.error}'),
            );
          }
          return Center(child: Text('Unknown state'));
        },
      ),
    );
  }

  Widget buildCourseItem(PythonModel course) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          width: 350.0.w,
          height: 160.0.h,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0.h),
                Text(
                  course.progress ? "Success" : "Not Success",
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    color: getStateColor(course.status),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 20),
                          child: Text(
                            "Rate: ${course.rate.toDouble()}% ",
                            style: TextStyle(
                              fontSize: 18.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.0.w),
                    course.status ?ElevatedButton(
                      onPressed: () {
                        PythonCourseCubit.num=course.Id;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonScreen(),
                          ),
                        );
                      },
                      child: Text(
                        course.progress? "Take It again" : "Take the lesson",
                        style: TextStyle(fontSize: 16.0.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        course.status? course.rate >= 60 ? Colors.green : Colors.red : Colors.deepPurple
                        ,
                        foregroundColor: Colors.white,
                        fixedSize: Size(160.w, 40.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ) : ElevatedButton(
                      onPressed: () {
                        PythonCourseCubit.num=course.Id;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonScreen(),
                          ),
                        );
                      },
                      child: Icon(Icons.lock),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        course.status? course.rate >= 60 ? Colors.green : Colors.red : Color(0xFFD69ADE)
                        ,
                        foregroundColor: Colors.white,
                        fixedSize: Size(160.w, 40.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
