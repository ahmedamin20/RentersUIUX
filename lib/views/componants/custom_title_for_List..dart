import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomTitleForList extends StatelessWidget {
  final String titleText, buttonText;
  final Function() onpress;
  const CustomTitleForList(
      {super.key,
      required this.titleText,
      required this.buttonText,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: TextStyleManager.textStyle18w700.copyWith(
            color: ColorsManager.grayDark,
          ),
        ),
        TextButton(
          onPressed: onpress,
          child: Text(
            buttonText,
            style: TextStyleManager.textStyle14w500.copyWith(
              color: ColorsManager.graySimiDark,
            ),
          ),
        )
      ],
    );
  }
}
