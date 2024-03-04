import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField(
      {Key? key,
        required this.text,
        this.suffixIcon,
        required this.isSecure,
        this.prefixIcon,
        //required this.textAlign,
        required this.textColor,
        required this.horizontalValue,
        required this.verticalValue,
        required this.controller})
      : super(key: key);
  String text;
  Widget? suffixIcon;
  bool isSecure = false;
  Widget? prefixIcon;
  //TextAlign textAlign;
  Color textColor;
  double horizontalValue;
  double verticalValue;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        controller: controller,
        obscureText: isSecure,
       // textAlign: textAlign,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalValue, vertical: verticalValue),
            hintText: text,
            isDense: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintStyle: TextStyle(color: textColor,fontSize: 14),
            //suffixIcon: const Icon(Icons.search_sharp)
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyScale, width: 1.0),
                borderRadius: BorderRadius.circular(50.0)
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyScale, width: 1.0),
                borderRadius: BorderRadius.circular(50.0)
            ),
            errorBorder: InputBorder.none,
            prefixIconConstraints: BoxConstraints(maxWidth: 8.h),
            //disabledBorder: InputBorder.none,
            fillColor: AppColors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyScale, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}