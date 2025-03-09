import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../forget_pasword_with_phone_screen/forget_password_with_phone.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var passwordController = TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 300.0),
              child: Text(
                'CodeQuest',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Change Your Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 220),
              child: Text(
                'Current Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20, start: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300], //el [] 3shan opacity
                ),
                child: defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPassword,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Password must not be empty';
                    }
                    return null;
                  },
                  prefix: Icons.lock,
                  sufixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 250),
              child: Text(
                'New Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20, start: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300], //el [] 3shan opacity
                ),
                child: defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPassword,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Password must not be empty';
                    }
                    return null;
                  },
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
              padding: const EdgeInsetsDirectional.only(end: 200),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordWithPhoneScreen(),
                    ),
                  );
                },
                child: Text(
                  'Forget your password?',
                  style: TextStyle(fontSize: 15, color: Colors.deepPurple),
                ),
              ),
            ),
            SizedBox(height: 300),
            Container(
              width: 200.0,
              height: 50.0,
              color: Colors.deepPurple,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
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
    );
  }
}
