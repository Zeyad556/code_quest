import 'package:code_quest/modules/prepare_screen/prepare.dart';
import 'package:code_quest/modules/profile_screen/profile_cubit.dart';
import 'package:code_quest/modules/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../certefication_screen/certefication.dart';
import '../courses_apply_screen/courses_apply_screen.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen({super.key, required this.index});
  @override
  State<HomeScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3, initialIndex: widget.index); // Set default index (1 in this case)
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: Color(0xFFAA60C8),
        appBar: AppBar(
          toolbarHeight: 130.0.h,
          backgroundColor: Color(0xFFAA60C8),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 50.0, end: 5.0),
              child: IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white, size: 40),
                onPressed: () {
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
                    controller: controller,
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
          controller: controller,
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
