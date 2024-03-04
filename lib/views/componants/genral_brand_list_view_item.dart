import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class GenralBrandListItem extends StatelessWidget {
  const GenralBrandListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: ColorsManager.border),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        alignment: Alignment.center,
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorsManager.grayDark,
                    borderRadius: BorderRadius.circular(RadiusManager.r10)),
                child: Image.asset(
                  AssetsManager.tesla,
                  color: Colors.white,
                  width: 50.r,
                  height: 50.r,
                ),
              ),
              SpaceManager.sizedBox12h(context),
              Text(
                "tesla",
                style: TextStyleManager.textStyle12w700,
              ),
            ]),
      ),
    );
  }
}
