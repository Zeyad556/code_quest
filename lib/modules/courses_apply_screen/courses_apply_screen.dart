import 'package:code_quest/cherryToast/CherryToastMsgs.dart';
import 'package:code_quest/modules/prepare_screen/prepare.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:code_quest/modules/courses_apply_screen/courses_apply_cubit.dart';
import 'package:code_quest/modules/courses_apply_screen/courses_apply_state.dart';
import 'package:code_quest/shared/components/components.dart';

class ApplyScreen extends StatefulWidget {
  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  @override
  void initState() {
    context.read<CoursesApplyCubit>().courseApplyProcess();
    super.initState();
  }

  String titleToAsset(String title) {
    return 'assets/images/' + title.replaceAll(' ', '%20') + '.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EAFF),
      body: BlocConsumer<CoursesApplyCubit, CoursesApplyState>(
        listener: (context, state) {
          if (state is CoursesApplySucces) {
            CherryToastMsgs.CherryToastSuccess(
              context: context,
              title: 'Course Enrolled',
              description: 'Enrolled successfully',
            ).show(context);
            // Navigator.push(context,MaterialPageRoute(builder: (context)=>PrepareScreen()));
            DefaultTabController.of(context)?.animateTo(1);
          }
        },
        builder: (context, state) {
          print(state);
          if (state is CoursesApplyLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CoursesApplyloaded) {
            final courses = CoursesApplyCubit.apply;
            print(courses);
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
                        print(course.title);
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.0.h),
                          child: CourseCard(
                            courseName: course.title,
                            imagePath: titleToAsset(course.title),
                            fontSize: 22.sp,
                            width: 500.w,
                            height: 150.h,
                            sizedheight: 25.h,
                            buttonWidth: 190.w,
                            buttonHeight: 35.h,
                            buttonWord: 'Get Course',
                            Pressed: () {
                              CoursesApplyCubit.enrolledCourse = course.id;
                              context.read<CoursesApplyCubit>().enrollProcess();
                            },
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
    );
  }
}
