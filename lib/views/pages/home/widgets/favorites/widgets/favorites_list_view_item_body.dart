import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class FavoritesListViewItemBody extends StatelessWidget {
  const FavoritesListViewItemBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1, child: Image.asset(AssetsManager.carImage, height: 70.h)),
        SpaceManager.sizedBox14w(context),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FARES",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyleManager.textStyle18w700
                    .copyWith(color: ColorsManager.grayDark),
              ),
              SpaceManager.sizedBox8h(context),
              Row(
                children: [
                  Image.asset(AssetsManager.googleIcon),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
