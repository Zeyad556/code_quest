import 'package:code_quest/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CerteficationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
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
                  width: 500,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ]
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80.w,
                      ), // Creates space for the floating image
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 250,top: 10),
                        child: Text(
                          'Paython',
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 80,end: 30),
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
          Positioned(
            width: 140.w,
            height: 140.h,
            top: 5, // Adjust this value to move the image up
            right: 5, // Positioning for the left side
            child: Image.asset(
              'assets/images/email_certified.png',
              width: 140.w,
              height: 140.h,
            ),
          ),
        ]
      ),
    );
  }
}
