import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.details,
  });
  final String details;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.blue, width: 1.5)),
                  ),
                  child: Text(TextManager.details.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyleManager.textStyle12w500.copyWith(
                        color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.blue,
                      )),
                ),
              ],
            ),
            SpaceManager.sizedBox16h(context),
            Text(
              details,
                style: TextStyleManager.textStyle14w500.copyWith(
                  color:LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.graySimiDark,
                  height: 1.5,
                )),
          ],
        ),
      ),
    );
  }
}
