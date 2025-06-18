import 'package:code_quest/modules/prepare_screen/prepare.dart';
import 'package:code_quest/modules/profile_screen/profile_cubit.dart';
import 'package:code_quest/modules/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../certefication_screen/certefication.dart';
import '../certefication_screen/certfication_cubit.dart';
import '../courses_apply_screen/courses_apply_screen.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen({super.key, required this.index});

  @override
  State<HomeScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      vsync: this,
      length: 3,
      initialIndex: widget.index,
    ); // Set default index (widget.index)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAA60C8),
      appBar: AppBar(
        backgroundColor: Color(0xFFAA60C8),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white, size: 40),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
        title: Text(
          "Code Quest",
          style: TextStyle(
            fontSize: 30.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFAA60C8),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 50.0),
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
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Center(child: ApplyScreen()),
                Center(child: PrepareScreen()),
                Center(
                  child: BlocProvider(
                    create: (context) => CertficationCubit(),
                    child: CerteficationScreen(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
