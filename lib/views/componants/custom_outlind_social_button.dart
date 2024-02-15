import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CutomOutlindSocialButton extends StatelessWidget {
  final String text, logo;
  final Color? logoColor;
  final Color textColor;
  final Color borderColor;
  final Function() onPressed;

  const CutomOutlindSocialButton(
      {super.key,
      required this.text,
      required this.logo,
      required this.onPressed,
      this.textColor = ColorsManager.grayDark,
      this.borderColor = ColorsManager.gray,
      this.logoColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              style: BorderStyle.solid, width: 1, color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(RadiusManager.r16)),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding:
              EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.w, right: 55.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                logo,
                width: 24.w,
                color: logoColor,
              ),
              Text(
                text,
                style:
                    TextStyleManager.textStyle16w500.copyWith(color: textColor),
              )
            ],
          ),
        ));
  }
}
