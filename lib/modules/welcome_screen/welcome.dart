import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../log_in_screen/log_in.dart';
import '../sign_up_screen/sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 60.0,
                        vertical: 30.0,
                      ),
                      child: Image(
                        image: AssetImage('assets/images/woman_logo.png'),
                        width: 300.0.w,
                        height: 500.0.h,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 30.0,
                        vertical: 30,
                      ),
                      child: Image(
                        image: AssetImage('assets/images/code_quest_logo.png'),
                        width: 80.0.w,
                        height: 100.0.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 500),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'Hi !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'welcome to CodeQuest. Here , you will',
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'learn programming easily and',
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'effectively',
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0.h),
              Column(
                children: [
                  Container(
                    width: 300.0.w,
                    height: 55.0.h,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.deepPurple,
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 25.0.sp,
                          color: Colors.white,
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogInScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15.0.h),
                  Container(
                    width: 300.0.w,
                    height: 55.0.h,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                            Colors.deepPurple, // Text and border color
                        side: BorderSide(
                          color: Colors.deepPurple,
                        ), // Border color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      child: Text("Register",style: TextStyle(fontSize: 25.sp),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0.h),
              Column(
                children: [
                  Text(
                    'sign up using',
                    style: TextStyle(
                      fontSize: 23.0.sp,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 150),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/facebook logo.png'),
                          width: 35.0.w,
                          height: 35.0.h,
                        ),
                        SizedBox(width: 5.0.w),
                        Image(
                          image: AssetImage('assets/images/google logo.png'),
                          width: 35.0.w,
                          height: 35.0.h,
                        ),
                        SizedBox(width: 5.0.w),
                        Image(
                          image: AssetImage('assets/images/microsoft logo.png'),
                          width: 35.0.w,
                          height: 35.0.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
