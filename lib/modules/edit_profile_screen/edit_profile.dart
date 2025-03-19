import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/components/components.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 240.0),
          child: Text(
            "CodeQuest",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Expanded(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 30.0.sp,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20.0.h),
              Center(
                child: Container(
                  width: 340.w,
                  height: 550.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile Image
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10.0),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 70.0,
                              backgroundColor: Colors.deepPurple,
                              child: Icon(
                                Icons.person,
                                size: 100.0,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              right: -10,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildProfileField("First Name", "Abeer"),
                      buildProfileField("Last Name", "Fouaad"),
                      buildProfileField(
                        "Email",
                        "abuoo100@gmail.com",
                        isBold: true,
                      ),
                      buildProfileField("Phone Number", "01234567890"),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          "You may receive WhatsApp and SMS notifications from us.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      buildProfileField("Birthday", "06/12/2005", isBold: true),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Center(
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
                        label: Text(
                          "Edit",
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
                        child: Text("Cancel"),
                      ),
                    ),
                  ],
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
