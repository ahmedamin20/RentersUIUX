import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class FavoritesListViewItemFooter extends StatelessWidget {
  const FavoritesListViewItemFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsManager.engineIcon,
          height: 14.h,
        ),
        Text(
          "450 hp",
          style: TextStyleManager.textStyle12w500
              .copyWith(color: ColorsManager.graySimiDark),
        ),
        SpaceManager.sizedBox12w(context),
        Image.asset(
          AssetsManager.engine2Icon,
          height: 14.h,
        ),
        Text(
          "automatic",
          style: TextStyleManager.textStyle12w500
              .copyWith(color: ColorsManager.graySimiDark),
        ),
        const Spacer(),
        Text(
          "\$83.124.77",
          style: TextStyleManager.textStyle16w700
              .copyWith(color: ColorsManager.grayDark),
        ),
      ],
    );
  }
}
