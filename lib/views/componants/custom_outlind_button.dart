import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomOutLinedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomOutLinedButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(16.r),
          side: const BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: ColorsManager.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(RadiusManager.r16)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text.tr(),
          style: TextStyleManager.textStyle16w700
              .copyWith(color: ColorsManager.primaryColor),
        ));
  }
}
