import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/pages/onbording/widgets/body_section.dart';
import 'package:ksb/views/pages/onbording/widgets/top_section.dart';

class OnBoardingDetailsView extends StatelessWidget {
  final ValueNotifier<int> pageIndex;
  final AnimationController colorController;
  const OnBoardingDetailsView({
    super.key,
    required this.pageIndex,
    required this.colorController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TopSection(pageIndex: pageIndex),
          BodyScetion(
            pageIndex: pageIndex,
            colorController: colorController,
          ),
          CustomElevatedButton(
            text: TextManager.getStart.tr(),
            color: checkPageVlue()
                ? ColorsManager.white
                : ColorsManager.primaryColor,
            textColor: checkPageVlue()
                ? ColorsManager.primaryColor
                : ColorsManager.white,
            onPressed: () {
              context.go(AppRouter.startView);
            },
          ),
        ],
      ),
    ));
  }

  bool checkPageVlue() {
    return pageIndex.value == 1;
  }
}
