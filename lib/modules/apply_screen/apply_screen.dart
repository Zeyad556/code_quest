import 'package:code_quest/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20.0,
                  end: 150.0,
                ),
                child: Text(
                  'Get Your Course',
                  style: TextStyle(
                    fontSize: 22.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0.h),
              CourseCard(
                courseName: 'Paython',
                imagePath: 'assets/images/paython_logo.png',
                fontSize: 17,
                width: 500,
                height: 160,
                sizedheight: 50,
                buttonWidth: 150,
                buttonHeight: 40,
                buttonWord: 'Get Certified',
              ),
              SizedBox(height: 20.0.h),
              CourseCard(
                courseName: 'C',
                imagePath: 'assets/images/c_logo.png',
                fontSize: 30,
                width: 500,
                height: 160,
                sizedheight: 50,
                buttonWidth: 150,
                buttonHeight: 40,
                buttonWord: 'Get Certified',
              ),
              SizedBox(height: 20.0.h),
              CourseCard(
                courseName: 'C++',
                imagePath: 'assets/images/c++_logo.png',
                fontSize: 25,
                width: 500,
                height: 160,
                sizedheight: 50,
                buttonWidth: 150,
                buttonHeight: 40,
                buttonWord: 'Get Certified',
              ),
              SizedBox(height: 20.0.h),
              CourseCard(
                courseName: 'Java',
                imagePath: 'assets/images/java_logo.png',
                fontSize: 21,
                width: 500,
                height: 160,
                sizedheight: 50,
                buttonWidth: 150,
                buttonHeight: 40,
                buttonWord: 'Get Certified',
              ),
              SizedBox(height: 20.0.h),
              CourseCard(
                courseName: 'Css',
                imagePath: 'assets/images/css_logo.png',
                fontSize: 26,
                width: 500,
                height: 160,
                sizedheight: 50,
                buttonWidth: 150,
                buttonHeight: 40,
                buttonWord: 'Get Certified',
              ),
              SizedBox(height: 20.0.h),
              CourseCard(
                courseName: 'Java Script',
                imagePath: 'assets/images/javascript_logo.png',
                fontSize: 17.1,
                width: 500,
                height: 160,
                sizedheight: 50,
                buttonWidth: 150,
                buttonHeight: 40,
                buttonWord: 'Get Certified',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
