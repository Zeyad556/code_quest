import 'package:flutter/material.dart';
import '../../shared/components/components.dart';

class CheckCodeScreen extends StatefulWidget {
  const CheckCodeScreen({super.key});

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {
  var codeController = TextEditingController();
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
                'Forget Your Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 80.0),
              child: Text(
                'Check your SMS massage',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 35.0),
              child: Text(
                'We sent a code to your number. Enter that code to confirm your account.',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.grey[300],
              ),
              child: defaultFormField(
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 200),
              child: Text(
                'Try another way',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 400),
            Container(
              width: 200,
              height: 50,
              color: Colors.deepPurple,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'Next->',
                  style: TextStyle(fontSize: 25, color: Colors.white),
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
