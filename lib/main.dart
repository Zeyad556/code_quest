import 'package:code_quest/modules/apply_screen/apply_screen.dart';
import 'package:code_quest/modules/check_code_screen/check_code.dart';
import 'package:code_quest/modules/log_in_screen/log_in.dart';
import 'package:code_quest/modules/sign_in_screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'modules/welcome_screen/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApplyScreen(),
    );
  }
}
