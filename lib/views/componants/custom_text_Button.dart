import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? textColor;

  const CustomTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textColor = ColorsManager.primaryColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: TextStyleManager.textStyle12w700.copyWith(
            color: textColor,
          )),
    );
  }
}
