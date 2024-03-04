import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';

class CustomTextBodyWidget extends StatelessWidget {
  final String titleText;
  final String bodyText;
  final TextAlign? textAlign;

  final Color titleColor, bodyColor;

  const CustomTextBodyWidget({
    super.key,
    required this.titleText,
    required this.bodyText,
    this.bodyColor = ColorsManager.gray,
    this.titleColor = ColorsManager.grayDark,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          titleText.tr(),
          textAlign: textAlign,
          style: TextStyleManager.textStyle24w600.copyWith(color: LayoutCubit.get(context).isDark ? ColorsManager.white:titleColor),
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          bodyText.tr(),
          textAlign: textAlign,
          style: TextStyleManager.textStyle14w500
              .copyWith(letterSpacing: 0.40.w, height: 1.5.h,
              color: LayoutCubit.get(context).isDark ? ColorsManager.white : bodyColor),
        ),
      ],
    );
  }
}
