import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/theme/app_colors.dart';

class PrimaryTextfield extends StatelessWidget {
  //const PrimaryTextfield({super.key});
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  Widget? suffixIcon;
  bool? isObscure;

  PrimaryTextfield(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.controller,
      this.isObscure,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Adjust width as needed
      decoration: BoxDecoration(
        color: Colors.white, // Set background color
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(AppColors.grey).withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: isObscure == true ? true : false,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.012.sh),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
