import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultFormField({
  int? max,
  int? min,
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onchange,
  bool isPassword = false,
  String? Function(String?)? validator,
  String? lable,
  IconData? prefix,
  IconData? suffix,
  Function? sufixPressed,
}) => TextFormField(
  maxLength: max,
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

// Widget defaultButton({
//   double width = double.infinity,
//   double height = double.infinity,
//   Color background = Colors.blue,
//   bool isUpperCase = true,
//   double radius = 0.0,
//   required Function onPressed,
//   required String text,
// }) => Container(
//   width: width,
//   height: height,
//   child: MaterialButton(
//     onPressed: onPressed(),
//     child: Text(
//       isUpperCase ? text.toUpperCase() : text,
//       style: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 20.0,
//       ),
//     ),
//   ),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(radius),
//     color: background,
//   ),
// );

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
  final Function()? Pressed;
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
    required this.Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior:
          Clip.none, // Allows the image to be placed outside the container
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.h),
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            color: Colors.grey[250],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 1),
            ],
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 10,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseName,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: sizedheight.h),
                SizedBox(
                  width: buttonWidth.w,
                  height: buttonHeight.h,
                  child: ElevatedButton(
                    onPressed: Pressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD69ADE),
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
          width: 120.w,
          height: 120.h,
          top: -20, // Adjust this value to move the image up
          right: -10, // Positioning for the left side
          child: CircleAvatar(
            radius: 5, // Adjust the size
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                imagePath,
                width: 120.w,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget profileDetailCard(String title, String value) {
  return Padding(
    padding: const EdgeInsetsDirectional.only(end: 90.0, top: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0),
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

Widget divider() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Divider(color: Colors.grey),
  );
}

Widget buildProfileField(
  String label,
  TextEditingController value, {
  bool isBold = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Container(width: double.infinity, height: 1, color: Colors.black),
      ],
    ),
  );
}
