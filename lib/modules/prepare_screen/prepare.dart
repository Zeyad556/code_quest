import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:code_quest/modules/prepare_screen/prepare_cubit.dart';
import 'package:code_quest/modules/prepare_screen/prepare_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../paython_course/paython_course_screen.dart';

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
          children: [
            // the rest of your container here
            SizedBox(height: 15.0.h),
            Center(
              child: Container(
                width: 360.w,
                height: 310.h,
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
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 150.0,bottom: 45),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Slider(
                        value: progress,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: "${progress.toInt()}%",
                        activeColor: Colors.deepPurple,
                        onChanged: (value) {},
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                        child: Text(
                          "${progress.toInt()}% OF 100% of the course to unlock the certificate",
                          style: TextStyle(fontSize: 17.6.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
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
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Continue Preparation',
                            style: TextStyle(color: Colors.white, fontSize: 16.0.sp),
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
          top: -10,
          right: -3,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/Python.png',
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
