import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onchange,
  bool isPassword = false,
  required String? Function(String?) validator,
  String? lable,
  IconData? prefix,
  IconData? suffix,
  Function? sufixPressed,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onchange,
  validator: validator,
  decoration: InputDecoration(
    labelText: lable, //hintText da el klma msh hatfdl mawgoda
    prefix: Icon(
      //lw 3ayzha fel a5r tb2a sifxIcon
      prefix,
    ),
    suffixIcon:
        suffix != null
            ? IconButton(
              onPressed: sufixPressed != null ? () => sufixPressed!() : null,
              icon: Icon(
                //lw 3ayzha fel a5r tb2a sifxIcon
                suffix,
              ),
            )
            : null,
    border: OutlineInputBorder(),
  ),
);

Widget defaultButton({
  double width = double.infinity,
  double height = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function onPressed,
  required String text,
}) => Container(
  width: width,
  height: height,
  child: MaterialButton(
    onPressed: onPressed(),
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
);

class CourseCard extends StatelessWidget {
  final String courseName;
  final String imagePath;
  final double fontSize;
  final double width;
  final double height;
  final double buttonWidth;
  final double buttonHeight;
  final double sizedheight;
  final String buttonWord;
  CourseCard({
    required this.courseName,
    required this.imagePath,
    required this.fontSize,
    required this.width,
    required this.height,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.sizedheight,
    required this.buttonWord,

  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior:
          Clip.none, // Allows the image to be placed outside the container
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          padding: EdgeInsets.all(16),
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 1),
            ],
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 250.0),
            child: Column(
              children: [
                SizedBox(width: 80.w), // Creates space for the floating image
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 80.0),
                  child: Text(
                    courseName,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: sizedheight.h),
                Container(
                  width: buttonWidth.w,
                  height: buttonHeight.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      buttonWord,
                      style: TextStyle(color: Colors.white, fontSize: 14.0.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          width: 140.w,
          height: 140.h,
          top: -20, // Adjust this value to move the image up
          right: 5, // Positioning for the left side
          child: CircleAvatar(
            radius: 5, // Adjust the size
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                imagePath,
                width: 130.w,
                height: 130.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
