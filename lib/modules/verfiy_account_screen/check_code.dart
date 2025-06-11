import 'package:code_quest/modules/home_screen/home.dart';
import 'package:code_quest/modules/sign_up_screen/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/components.dart';

class CheckCodeScreen extends StatefulWidget {
  const CheckCodeScreen({super.key});

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {
  var codeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Scaffold(
        backgroundColor: Color(0xFFE5D4FF),
      appBar: AppBar(backgroundColor: Color(0xFFE5D4FF),),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          reverse: true,
          child: BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is VerfiyOtpSuccess) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen(index: 0,)),
                  (route) => false,
                );
              } else if (state is VerfiyOtpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Column(
              children: [
                SizedBox(height: 10.0.h),
                Center(
                  child: Text(
                    'Verfiy Your account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30.0.h),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 65.0),
                  child: Text(
                    'Check your Email massage',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0.h),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 35.0),
                  child: Text(
                    'We sent a code to your Email. Enter that code to confirm your account.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15.0.h),
                Container(
                  width: 350.w,
                  child: defaultFormField(
                    max: 6,
                    controller: codeController,
                    type: TextInputType.number,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Code must not be empty';
                      }
                      return null;
                    },
                    lable: 'Enter code',
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 210),
                  child: Text(
                    'Try another way',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 150.h),
                Container(
                  width: 230.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFD69ADE),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.verfiyOtp(
                          context,
                          cubit.emailController.text,
                            codeController.text,
                          // int.parse(codeController.text),
                        );
                      }
                    },
                    child: Text(
                      'Next ->',
                      style: TextStyle(fontSize: 25.sp, color: Colors.white),
                    ),
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
      ),
    );
  }
}
