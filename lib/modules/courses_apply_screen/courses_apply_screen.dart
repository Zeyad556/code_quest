import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:code_quest/modules/courses_apply_screen/courses_apply_cubit.dart';
import 'package:code_quest/modules/courses_apply_screen/courses_apply_state.dart';
import 'package:code_quest/shared/components/components.dart';

import 'courses_apply_model.dart';

class ApplyScreen extends StatefulWidget {
  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final String image = 'paython_logo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CoursesApplyCubit()..courseApplyProcess(CoursesApplyModel(id: 0, title: '')), // Fetch courses
        child: BlocBuilder<CoursesApplyCubit, CoursesApplyState>(
          builder: (context, state) {
            if (state is CoursesApplyLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CoursesApplyloaded) {
              final courses = state.apply;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get Your Course',
                        style: TextStyle(
                          fontSize: 22.0.sp,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 20.0.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 20.0.h),
                            child: CourseCard(
                              courseName: course.title,
                              imagePath: 'assets/images/'+ course.title+'.png', // Adjust if image name comes from API
                              fontSize: 23.sp,
                              width: 500.w,
                              height: 160.h,
                              sizedheight: 30.h,
                              buttonWidth: 150.w,
                              buttonHeight: 40.h,
                              buttonWord: 'Get Certified',
                              onPressed: (){},
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is CoursesApplyFailure) {
              return Center(child: Text(state.error));
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
