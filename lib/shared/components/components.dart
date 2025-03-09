import 'package:flutter/material.dart';

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
