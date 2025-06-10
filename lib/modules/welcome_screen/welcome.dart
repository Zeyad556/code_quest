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
      backgroundColor: Color(0xFFE5D4FF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 60.0,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/woman_logo.png'),
                      width: 300.0.w,
                      height: 500.0.h,
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
            Container(
              width: 300.0.w,
              height: 55.0.h,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: Color(0xFFD69ADE),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 25.0.sp, color: Colors.white),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
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
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Color(0xFFD69ADE), // Text and border color
                  side: BorderSide(
                    color: Color(0xFFD69ADE),
                    width: 3,
                  ), // Border color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text("Register", style: TextStyle(fontSize: 25.sp)),
              ),
            ),
            SizedBox(height: 10.0.h),
            Row(
              children: [
                Expanded(child: Divider(thickness: 1, color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Text(
                    "Or sign in with",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: Divider(thickness: 1, color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/google_logo.png"),
                ),
                SizedBox(width: 7.w),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/facbook_logo.png"),
                ),
                SizedBox(width: 7.w),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/apple_logo.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
