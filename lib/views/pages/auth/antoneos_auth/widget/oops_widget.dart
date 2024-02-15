import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/services/app_router.dart';
import '../../../../componants/custom_elevated_button.dart';

class OopsWidget extends StatelessWidget {
  const OopsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h,),
        LottieBuilder.asset(
          "assets/json/oops.json",
          height: 200.h,
          width: 400.w,
        ),
        Text(TextManager.oops,style: TextStyleManager.textStyle24w600.copyWith(color: ColorsManager.colorText),),
        SizedBox(height: 16.h,),
        Text(TextManager.unexpectedError,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText),),
        SizedBox(height: 33.h,),
        Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w),
          child: CustomElevatedButton(text: TextManager.retry, onPressed: (){

          },),
        )

      ],
    );
  }
}
