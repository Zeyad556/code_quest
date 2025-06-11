import 'package:code_quest/cherryToast/CherryToastMsgs.dart';
import 'package:code_quest/modules/edit_profile_screen/edit_cubit.dart';
import 'package:code_quest/modules/edit_profile_screen/edit_model.dart';
import 'package:code_quest/modules/log_in_screen/login_cubit.dart';
import 'package:code_quest/modules/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/components.dart';
import '../profile_screen/profile_model.dart';

class EditProfileScreen extends StatefulWidget {
  final ProfileModel dataModel;
  EditProfileScreen({super.key, required this.dataModel});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController firstName;

  late TextEditingController lastName;

  late TextEditingController email;

  late TextEditingController phoneNumber;

  late TextEditingController birth;
  @override
  void initState() {
    super.initState();
    firstName = TextEditingController(text: widget.dataModel.firstName);
    lastName = TextEditingController(text: widget.dataModel.lastName);
    email = TextEditingController(text: widget.dataModel.email);
    phoneNumber = TextEditingController(text: widget.dataModel.phoneNum);
    birth = TextEditingController(text: widget.dataModel.birthDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EAFF),
      appBar: AppBar(
          backgroundColor: Color(0xFFF1EAFF),
      ),
      body: BlocConsumer<EditCubit, EditState>(
        listener: (context, state) {
          if (state is EditSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          } else if (state is EditFauiler) {
            CherryToastMsgs.CherryToastError(
              context: context,
              title: 'error',
              description: 'invaild data',
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is EditLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 40,
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 30.0.sp,
                      color: Color(0xFFAA60C8),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 20.0.h),
                Center(
                  child: Container(
                    width: 340.w,
                    height: 550.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Profile Image
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 10.0,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                const CircleAvatar(
                                  radius: 70.0,
                                  backgroundColor: Color(0xFFAA60C8),
                                  child: Icon(
                                    Icons.person,
                                    size: 100.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  right: -10,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          buildProfileField("First Name", firstName),
                          SizedBox(height: 20.h),
                          buildProfileField("Last Name", lastName),
                          SizedBox(height: 20.0.h),
                          buildProfileField("Email", email, isBold: true),
                          SizedBox(height: 20.0.h),
                          buildProfileField("Phone Number", phoneNumber),
                          SizedBox(height: 20.0.h),
                          buildProfileField("Birthday", birth, isBold: true),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit Profile Button
                      Container(
                        width: 150.0.w,
                        height: 40.0.h,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.read<EditCubit>().editProfile(
                              EditModel(
                                id: LoginCubit.userId,
                                firstName: firstName.text,
                                lastName: lastName.text,
                                email: email.text,
                                newPhoneNum: phoneNumber.text,
                                birthDate: birth.text,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD69ADE), // Dark Purple
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          label: Text(
                            "Edit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w), // Spacing between buttons
                      // Log out Button
                      Container(
                        width: 150.0.w,
                        height: 40.0.h,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                            Color(0xFFD69ADE), // Text and border color
                            side: BorderSide(
                              color: Color(0xFFD69ADE),
                            ), // Border color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          child: Text("Cancel",style: TextStyle(
                            color: Color(0xFFD69ADE),fontWeight: FontWeight.bold,fontSize: 16.sp,),
                        ),
                      ),
                      )],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
