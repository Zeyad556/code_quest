import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../check_code_screen/check_code.dart';

class ForgetPasswordWithPhoneScreen extends StatefulWidget {
  @override
  State<ForgetPasswordWithPhoneScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordWithPhoneScreen> {
  var phoneController = TextEditingController();
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
            SizedBox(height: 50.0),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 250),
              child: Text(
                'Phone Number',
                style: TextStyle(
                  color: Colors.black,
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
                controller: phoneController,
                type: TextInputType.phone,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone must not be empty';
                  }
                  return null;
                },
                lable: 'Enter code',
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 0),
              child: Text(
                'You may receive Whatsapp or SMS notfication from us',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15.0,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckCodeScreen()),
                  );
                },
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
