import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.pageIndex,
  });
  final ValueNotifier<int> pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
            builder: (context, int value, _) {
              return DotsIndicator(
                dotsCount: 2,
                position: value,
                decorator: DotsDecorator(
                  size: Size.square(6.0.r),
                  activeSize: Size(24.0.w, 6.0.h),
                  activeColor: Colors.white,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            },
            valueListenable: pageIndex,
          ),
          TextButton(
            onPressed: () {
              context.go(AppRouter.startView);
            },
            child: Text(TextManager.skip.tr(),
                style: TextStyleManager.textStyle16w700.copyWith(
                  color: pageIndex.value == 1
                      ? ColorsManager.white
                      : ColorsManager.primaryColor,
                )),
          ),
        ],
      ),
    );
  }
}
