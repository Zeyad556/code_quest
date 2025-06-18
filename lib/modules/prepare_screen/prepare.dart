import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:code_quest/modules/prepare_screen/prepare_cubit.dart';
import 'package:code_quest/modules/prepare_screen/prepare_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../python_course/paython_course_screen.dart';


class PrepareScreen extends StatefulWidget {
  @override
  State<PrepareScreen> createState() => _PrepareScreenState();
}
class _PrepareScreenState extends State<PrepareScreen> {
  @override
  void initState(){
    context.read<PrepareCubit>().courseProcess();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EAFF),
      body: BlocBuilder<PrepareCubit, PrepareState>(
        builder: (context, state) {
          if (state is PrepareLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PrepareLoaded) {
            final prepareList = state.coursePrepare;
            if (prepareList.isEmpty) {
              return Center(child: Text("You haven't enrolled in any courses yet."));
            }
            return ListView.builder(
              itemCount: prepareList.length,
              itemBuilder: (context, index) {
                final course = prepareList[index];
                return _buildCourseContainer(course.title, course.takenLessons, context,course.id);
              },
            );
          } else if (state is PrepareFailuer) {
            return Center(child: Text(state.error));
          }return Placeholder();
        },
      ),
    );
  }

  Widget _buildCourseContainer(String title, double progress, BuildContext context,int id) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0.h),
            Center(
              child: Container(
                width: 360.w,
                height: 270.h,
                decoration: BoxDecoration(
                  color: Colors.grey[250],
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20,end: 40),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Slider(
                      value: progress,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: "${progress.toInt()}%",
                      activeColor: Color(0xFFAA60C8),
                      onChanged: (value) {},
                    ),
                    Center(
                      child: Text(
                        "${progress.toInt()}% of the course to unlock the certificate",
                        style: TextStyle(fontSize: 17.6.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Container(
                        width: 200.w,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {
                            PrepareCubit.prepareId=id;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaythonCourseScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Color(0xFFAA60C8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          child: Text(
                            'Continue Preparation',
                            style: TextStyle(color: Colors.white, fontSize: 15.0.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          width: 130.w,
          height: 130.h,
          top: 15,
          right: -10,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/'+title+'.png',
                width: 140.w,
                height: 140.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
