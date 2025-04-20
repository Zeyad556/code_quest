import 'package:code_quest/counter_test/counter.dart';
import 'package:code_quest/modules/home_screen/home.dart';
import 'package:code_quest/modules/paython_course/paython_course_screen.dart';
import 'package:code_quest/modules/paython_course/python_course_cubit.dart';
import 'package:code_quest/modules/prepare_screen/prepare.dart';
import 'package:code_quest/modules/profile_screen/profile_cubit.dart';
import 'package:code_quest/modules/sign_up_screen/sign_up_cubit.dart';
import 'package:code_quest/modules/verfiy_account_screen/check_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'counter_test/class_a.dart';
import 'modules/log_in_screen/login_cubit.dart';
import 'modules/welcome_screen/welcome.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => SignUpCubit()),
        BlocProvider(create: (_) => PythonCourseCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
      ],
      child: MyApp(),
    ),
  );
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
      child: PageA(),
    );
  }
}
