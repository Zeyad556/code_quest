import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../forget_pasword_with_phone_screen/forget_password_with_phone.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, toolbarHeight: 30.0),
      resizeToAvoidBottomInset: false,
      body: Expanded(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 40.0,
                      ),
                      child: Image(
                        image: AssetImage('assets/images/woman_2_logo.png'),
                        width: 300.0,
                        height: 500.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: Image(
                        image: AssetImage('assets/images/code_quest_logo.png'),
                        width: 80.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 230),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 20,
                      start: 20,
                    ),
                    child: Container(
                      width: 360.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                      ),
                      child: defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone must not be empty';
                          }
                          return null;
                        },
                        lable: 'Enter your phone number',
                        prefix: Icons.phone,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 270),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 20,
                      start: 20,
                    ),
                    child: Container(
                      width: 360.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[350], //el [] 3shan opacity
                      ),
                      child: defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix:
                            isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                        isPassword: isPassword,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Password must not be empty';
                          }
                          return null;
                        },
                        lable: 'Enter your password',
                        prefix: Icons.lock,
                        sufixPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 210),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ForgetPasswordWithPhoneScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget your password?',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.deepPurple,
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          print(phoneController.text);
                          print(passwordController.text);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 300,
                    height: 50,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.deepPurple,
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          print(phoneController.text);
                          print(passwordController.text);
                        }
                      },
                    ),
                  ),
                ],
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
    );
  }
}
