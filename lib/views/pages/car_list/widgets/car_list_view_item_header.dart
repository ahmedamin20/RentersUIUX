import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CarListItemHeader extends StatelessWidget {
  const CarListItemHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Image.asset(
          AssetsManager.googleIcon,
          height: 14.r,
        )),
        const Spacer(),
        Icon(
          Icons.star,
          size: 14.r,
          color: ColorsManager.gold,
        ),
        Text(
          "4.8",
          style: TextStyleManager.textStyle12w500
              .copyWith(color: ColorsManager.gray),
        ),
      ],
    );
  }
}
