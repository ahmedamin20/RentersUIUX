import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomFoterMyCars extends StatelessWidget {
  const CustomFoterMyCars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyleManager.textStyle16w700
                  .copyWith(color: ColorsManager.greyscale500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SvgPicture.asset(AssetsManager.dateIcon),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "June 10, 2022",
                  style: TextStyleManager.textStyle16w700
                      .copyWith(color: ColorsManager.grayDark),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyleManager.textStyle16w700
                  .copyWith(color: ColorsManager.greyscale500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SvgPicture.asset(AssetsManager.clockSvg),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "June 10, 2022",
                  style: TextStyleManager.textStyle16w700
                      .copyWith(color: ColorsManager.grayDark),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
