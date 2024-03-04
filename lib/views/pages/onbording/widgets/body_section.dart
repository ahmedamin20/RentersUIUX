import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/views/componants/custom_text_body_widget.dart';

class BodyScetion extends StatelessWidget {
  final ValueNotifier<int> pageIndex;
  final AnimationController colorController;
  const BodyScetion({
    super.key,
    required this.pageIndex,
    required this.colorController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: PageController(),
        onPageChanged: (value) {
          pageIndex.value = value;
          if (value == 1) {
            colorController.forward();
          } else if (value == 0) {
            colorController.reverse();
          }
        },
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTextBodyWidget(
            titleText: TextManager.titleDetails,
            titleColor: ColorsManager.white,
            bodyText: TextManager.bodyDetails,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomTextBodyWidget(
                titleText: TextManager.secondTitleDetails,
                titleColor: ColorsManager.white,
                bodyText: TextManager.secondTitleDetails,
              ),
              const Spacer(),
              Padding(
                  padding: EdgeInsets.only(bottom: 75.h),
                  child: Image.asset(
                    AssetsManager.carImage,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
