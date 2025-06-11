import 'package:code_quest/modules/home_screen/home.dart';
import 'package:code_quest/modules/forget_pasword_with_phone_screen/forget_password_with_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/components.dart';
import 'login_cubit.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5D4FF),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(index: 1)),
              (route) => false,
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Image(
                            image: AssetImage('assets/images/woman_2_logo.png'),
                            width: 300.0.w,
                            height: 500.0.h,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 10.0,
                              vertical: 35.0,
                            ),
                            child: Image(
                              image: AssetImage(
                                'assets/images/code_quest_logo.png',
                              ),
                              width: 80.0.w,
                              height: 100.0.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0.h),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      lable: 'Enter your phone number',
                      prefix: Icons.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Phone must not be empty';
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0.h),
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0.h),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Password must not be empty';
                        return null;
                      },
                      lable: 'Enter your password',
                      prefix: Icons.lock,
                      sufixPressed:
                          () => setState(() => isPassword = !isPassword),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ForgetPasswordWithPhoneScreen(),
                              ),
                            ),
                        child: Text(
                          'Forget your password?',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: Color(0xFFD69ADE),
                        ),
                        child:
                            state is LoginLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  'LOG IN',
                                  style: TextStyle(
                                    fontSize: 20.0.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              phoneController.text,
                              passwordController.text,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
