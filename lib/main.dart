import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'modules/edit_profile_screen/edit_cubit.dart';
import 'modules/home_screen/home.dart';
import 'modules/log_in_screen/login_cubit.dart';
import 'modules/python_course/python_course_cubit.dart';
import 'modules/welcome_screen/welcome.dart';
import 'network/local/cash_helper.dart';
import 'modules/sign_up_screen/sign_up_cubit.dart';
import 'modules/profile_screen/profile_cubit.dart';
import 'modules/quizes_screen/quizes_cubit.dart';
import 'modules/courses_apply_screen/courses_apply_cubit.dart';
import 'modules/prepare_screen/prepare_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  final savedUser = CacheHelper.getLoginData();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => SignUpCubit()),
        BlocProvider(create: (_) => PythonCourseCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => QuizzesCubit()),
        BlocProvider(create: (_) => CoursesApplyCubit()),
        BlocProvider(create: (_) => PrepareCubit()),
        BlocProvider(create: (_) => EditCubit()),
      ],
      child: MyApp(isLoggedIn: savedUser != null), // ✅ تمرير حالة تسجيل الدخول
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoggedIn ? HomeScreen(index: 0) : WelcomeScreen(),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
