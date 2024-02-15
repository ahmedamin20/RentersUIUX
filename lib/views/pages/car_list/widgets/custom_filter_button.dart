import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomFilterButton extends StatelessWidget {
  final Function() onTap;
  const CustomFilterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(RadiusManager.r10),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
        decoration: BoxDecoration(
            border: Border.all(
              color: ColorsManager.border,
            ),
            borderRadius: BorderRadius.circular(RadiusManager.r10)),
        child: Row(children: [
          const Icon(
            Icons.filter_alt_rounded,
            color: ColorsManager.gray,
          ),
          Text(
            "Filter",
            style: TextStyleManager.textStyle14w500
                .copyWith(color: ColorsManager.gray),
          ),
        ]),
      ),
    );
  }
}
