import 'package:code_quest/modules/edit_profile_screen/edit_profile.dart';
import 'package:code_quest/modules/profile_screen/profile_cubit.dart';
import 'package:code_quest/modules/profile_screen/profile_model.dart';
import 'package:code_quest/modules/welcome_screen/welcome.dart';
import 'package:code_quest/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EAFF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.h),
        child: AppBar(
          backgroundColor: Color(0xFFAA60C8),
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top Row (Exit Icon + "CodeQuest" Title)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 10.h,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 240.0.w),
                      child: Text(
                        "CodeQuest",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0.sp,
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
                  color: Color(0xFFAA60C8),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          print("state" + state.toString());
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileFailure) {
            return Center(child: Text(state.error));
          }
          if (state is ProfileLoaded) {
            return SingleChildScrollView(
              child: profileDetail(state.profileData, context),
            );
          }
          return Container(); // placeHolder
        },
      ),
    );
  }

  Widget profileDetail(ProfileModel profileData, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0, top: 30.0),
          child: Text(
            profileData.firstName + ' ' + profileData.lastName,
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
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 20.0),
                    child: profileDetailCard('Email', profileData.email),
                  ),
                  SizedBox(height: 10.0.h),
                  Container(width: 300, height: 1.0, color: Colors.grey[500]),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 100.0),
                    child: profileDetailCard('Phone', profileData.phoneNum),
                  ),
                  SizedBox(height: 10.0.h),
                  Container(width: 300, height: 1.0, color: Colors.grey[500]),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 110.0),
                    child: profileDetailCard(
                      'Birthday',
                      profileData.birthDate.toString(),
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  Container(width: 300, height: 1.0, color: Colors.grey[500]),
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
                          builder: (context) => EditProfileScreen(dataModel: profileData, ),
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
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(width: 16), // Spacing between buttons
                // Log out Button
                Container(
                  width: 150.0.w,
                  height: 40.0.h,
                  child: OutlinedButton(
                    onPressed: () {
                      // استدعاء عملية تسجيل الخروج
                      context.read<ProfileCubit>().logout();

                      // إعادة التوجيه إلى شاشة الترحيب
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ),
                            (route) => false,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                      Colors.deepPurple, // Text and border color
                      side: BorderSide(
                        color: Colors.deepPurple,
                        width: 4.w,
                      ), // Border color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Log out",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
    );
  }
}
