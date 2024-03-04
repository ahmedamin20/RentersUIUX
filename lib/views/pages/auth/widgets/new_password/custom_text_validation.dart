import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomTextValidation extends StatelessWidget {
  final String text;
  final Color color;
  const CustomTextValidation(
      {super.key, required this.text, this.color = ColorsManager.gray});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline_outlined,
          color: color,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.008,
        ),
        Text(
          text,
          style: TextStyleManager.textStyle14w500.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
//  final RegExp numericRegex = RegExp(r'[0-9]');
//final RegExp specialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
