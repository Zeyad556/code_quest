import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:code_quest/modules/check_code_screen/check_code.dart';
import 'package:code_quest/modules/log_in_screen/log_in.dart';
import 'package:code_quest/modules/sign_in_screen/sign_in.dart';
import 'modules/home_screen/home.dart';
import 'modules/welcome_screen/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ), // Set base design size (adjust accordingly)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: child);
      },
      child: HomeScreen(),
    );
  }
}
