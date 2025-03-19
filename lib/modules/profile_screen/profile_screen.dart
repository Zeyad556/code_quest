import 'package:code_quest/modules/edit_profile_screen/edit_profile.dart';
import 'package:code_quest/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_screen/home.dart';

class ProfileScreen extends StatelessWidget {
  var notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top Row (Exit Icon + "CodeQuest" Title)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 300),
                      child: const Text(
                        "CodeQuest",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Profile Avatar
              const SizedBox(height: 10),
              Container(
                width: 150.w,
                height: 150.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 140.0,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Expanded(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20.0,
                  top: 30.0,
                ),
                child: Text(
                  'Zeyad',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 20.0),
                  child: Container(
                    width: 330.0.w,
                    height: 30.0.h,
                    color: Colors.grey[300],
                    child: defaultFormField(
                      controller: notesController,
                      type: TextInputType.text,
                      lable: 'Add Notes',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: Container(
                  width: 300.0.w,
                  height: 250.0.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(top: 10.0),
                    child: Column(
                      children: [
                        profileDetail('Email', 'zeyadsayed2004@gmail.com'),
                        SizedBox(height: 10.0.h),
                        Container(
                          width: 300,
                          height: 1.0,
                          color: Colors.grey[500],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 100.0),
                          child: profileDetail('Phone', '01124777880'),
                        ),
                        SizedBox(height: 10.0.h),
                        Container(
                          width: 300,
                          height: 1.0,
                          color: Colors.grey[500],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 110.0),
                          child: profileDetail('Birthday', '04/11/2004'),
                        ),
                        SizedBox(height: 10.0.h),
                        Container(
                          width: 300,
                          height: 1.0,
                          color: Colors.grey[500],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 110.0),
                          child: profileDetail('Password', ''),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 70.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit Profile Button
                      Container(
                        width: 150.0.w,
                        height: 40.0.h,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple, // Dark Purple
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          icon: Icon(Icons.edit, color: Colors.white, size: 23),
                          label: Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16), // Spacing between buttons
                      // Log out Button
                      Container(
                        width: 150.0.w,
                        height: 40.0.h,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                Colors.deepPurple, // Text and border color
                            side: BorderSide(
                              color: Colors.deepPurple,
                            ), // Border color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          child: Text("Log out"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
