import 'package:code_quest/modules/apply_screen/apply_screen.dart';
import 'package:code_quest/modules/prepare_screen/prepare.dart';
import 'package:code_quest/modules/profile_screen/profile_cubit.dart';
import 'package:code_quest/modules/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../certefication_screen/certefication.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 130.0.h,
          backgroundColor: Colors.deepPurple,
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 50.0, end: 5.0),
              child: IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white, size: 40),
                onPressed: () {
                  context.read<ProfileCubit>().getProfileData("01170911564");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsetsDirectional.only(top: 50.0),
            child: Row(
              children: [
                Text(
                  "CodeQuest",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 3,
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    tabs: [
                      Tab(text: "Apply"),
                      Tab(text: "Prepare"),
                      Tab(text: "Certify"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: ApplyScreen()),
            Center(child: PrepareScreen()),
            Center(child: CerteficationScreen()),
          ],
        ),
      ),
    );
  }
}
