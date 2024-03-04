import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final num width;

  final Function() onPressed;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = ColorsManager.primaryColor,
    this.textColor = ColorsManager.white,  this.width=343,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: 48.h,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16.r),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusManager.r16),
            ),
            backgroundColor: color),

        onPressed: onPressed,
        child: Center(
          child: Text(text.tr(),
              style: TextStyleManager.textStyle16w700.copyWith(
                color: textColor,
              )),
        ),
      ),
    );
  }
}
