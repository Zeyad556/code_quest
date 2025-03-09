import 'package:code_quest/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrepareScreen extends StatelessWidget {
  const PrepareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 20.0,
              end: 150.0,
            ),
            child: Text(
              'Your Preparation',
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15.0.h),
          CourseCard(
            courseName: 'Paython',
            imagePath: 'assets/images/paython_logo.png',
            fontSize: 17,
            width: 500,
            height: 200,
            sizedheight: 110,
            buttonHeight: 40,
            buttonWidth: 150,
            buttonWord: 'Continue Preparation',
          ),
        ],
      ),
    );
  }
}
