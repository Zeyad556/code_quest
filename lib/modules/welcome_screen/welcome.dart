import 'package:flutter/material.dart';
import '../log_in_screen/log_in.dart';
import '../sign_in_screen/sign_in.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 60.0,
                      vertical: 30.0,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/woman_logo.png'),
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
                      vertical: 30,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/code_quest_logo.png'),
                      width: 80.0,
                      height: 100.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 500),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      'Hi !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'welcome to CodeQuest. Here , you will',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Text(
                      'learn programming easily and',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 170.0),
                    child: Text(
                      'effectively',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Column(
              children: [
                Container(
                  width: 350.0,
                  height: 70.0,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Colors.deepPurple,
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 28.0, color: Colors.white),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInScreen()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  width: 350.0,
                  height: 70.0,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Colors.deepPurple,
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 28.0, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                Text(
                  'sign up using',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 170),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/facebook logo.png'),
                        width: 35.0,
                        height: 35.0,
                      ),
                      SizedBox(width: 5.0),
                      Image(
                        image: AssetImage('assets/images/google logo.png'),
                        width: 35.0,
                        height: 35.0,
                      ),
                      SizedBox(width: 5.0),
                      Image(
                        image: AssetImage('assets/images/microsoft logo.png'),
                        width: 35.0,
                        height: 35.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
