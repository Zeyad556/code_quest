import 'package:code_quest/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CerteficationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20.0,
                  end: 250.0,
                ),
                child: Text(
                  'Get Certified',
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0.h),
              Center(
                child: Container(
                  width: 500.w,
                  height: 170.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Creates space for the floating image
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 40,
                                start: 25,
                              ),
                              child: Text(
                                'Paython',
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 140.0.w),
                            Image.asset(
                              'assets/images/certified_logo.png',
                              width: 100.w,
                              height: 100.h,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 40),
                        child: Container(
                          width: 200.w,
                          height: 40.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Show',
                              style: TextStyle(
                                color: Colors.deepPurple,
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
            ],
          ),
        ],
      ),
    );
  }
}
