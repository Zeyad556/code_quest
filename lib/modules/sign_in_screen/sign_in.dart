import 'package:code_quest/modules/home_screen/home.dart';
import 'package:code_quest/shared/components/components.dart';
import 'package:flutter/material.dart';

class SignInModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String birth;

  SignInModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.birth,
  });
}

class SignInScreen extends StatefulWidget {
  List<SignInModel> signInData = [];
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastSameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isMale = false;
  bool isFemale = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, toolbarHeight: 30),
      resizeToAvoidBottomInset: false,
      body: Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 80,
                          end: 50,
                        ),
                        child: Image(
                          image: AssetImage('assets/images/sign_in_logo.png'),
                          width: 350.0,
                          height: 300.0,
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
                          image: AssetImage(
                            'assets/images/code_quest_logo.png',
                          ),
                          width: 100.0,
                          height: 95.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 80),
                          child: Text(
                            'First Name',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 20,
                            start: 20,
                          ),
                          child: Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[350], //el [] 3shan opacity
                            ),
                            child: defaultFormField(
                              controller: firstNameController,
                              type: TextInputType.name,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name must not be empty';
                                }
                                return null;
                              },
                              lable: 'Enter your name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 80),
                          child: Text(
                            'Last Name',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 20,
                            start: 20,
                          ),
                          child: Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[350], //el [] 3shan opacity
                            ),
                            child: defaultFormField(
                              controller: lastSameController,
                              type: TextInputType.name,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name must not be empty';
                                }
                                return null;
                              },
                              lable: 'Enter your last name',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 355),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 55),
                      child: Container(
                        width: 350,
                        height: 45,
                        decoration: BoxDecoration(color: Colors.grey[350]),
                        child: defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Email must not be empty';
                            }
                            return null;
                          },
                          lable: 'Enter your Email',
                          prefix: Icons.email,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 280),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 55),
                      child: Container(
                        width: 350,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.grey[350]),
                        child: defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone must not be empty';
                            }
                            return null;
                          },
                          lable: 'Enter your phone numebr',
                          prefix: Icons.phone,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 70),
                      child: Text(
                        'You may receive Whatsapp or SMS notfication from us',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 250),
                      child: Text(
                        'Password Number',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 55),
                      child: Container(
                        width: 350,
                        height: 45,
                        decoration: BoxDecoration(color: Colors.grey[350]),
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
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 250),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 55),
                      child: Container(
                        width: 350,
                        height: 45,
                        decoration: BoxDecoration(color: Colors.grey[350]),
                        child: defaultFormField(
                          controller: confirmPasswordController,
                          type: TextInputType.visiblePassword,
                          suffix:
                              isConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                          isPassword: isConfirmPassword,
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
                              isConfirmPassword = !isConfirmPassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 280),
                      child: Text(
                        'Your Gender',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 230),
                      child: Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isMale,
                              onChanged: (value) {
                                setState(() {
                                  isMale = value!;
                                });
                              },
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 230),
                      child: Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isFemale,
                              onChanged: (value) {
                                setState(() {
                                  isMale = value!;
                                });
                              },
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 320),
                      child: Text(
                        'Birthday',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 50),
                      child: Container(
                        width: 350,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[350], //el [] 3shan opacity
                        ),
                        child: defaultFormField(
                          controller: birthController,
                          type: TextInputType.datetime,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Birth must not be empty';
                            }
                            return null;
                          },
                          lable: 'DD/MM/YYYY',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  width: 280,
                  height: 60,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.deepPurple,
                    child: Text(
                      'Enter',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
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
