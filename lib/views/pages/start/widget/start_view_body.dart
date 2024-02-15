import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_text_body_widget.dart';
import 'package:ksb/views/pages/start/widget/auth_button_Animated.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextManager.ksbCrash.tr(),
            style: TextStyleManager.textStyle12w500
                .copyWith(color: ColorsManager.white),
          ),
          SpaceManager.sizedBox40h(context),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 85.w),
            child:  CustomTextBodyWidget(
                titleText: TextManager.startTitle.tr(),
                titleColor: ColorsManager.white,
                bodyColor: ColorsManager.white,
                bodyText: TextManager.startbody.tr()),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(AssetsManager.car2Image,
                height: MediaQuery.of(context).size.height * 0.30,
                fit: BoxFit.contain),
          ),
          const Spacer(),
          const AuthButtonsAnimted(),
        ],
      ),
    );
  }
}
