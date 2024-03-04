import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';

import '../../../../../core/resource/colors_manager.dart';
import '../../../../../core/resource/text_manager.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../../../../core/services/app_router.dart';
import '../../../../componants/custom_elevated_button.dart';

class NewPasswordWidget extends StatelessWidget {
  const NewPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(TextManager.newPassword,style: TextStyleManager.textStyle24w600.copyWith(color: ColorsManager.colorText),),
              SizedBox(height: 24.h,),
              Text(TextManager.setNewPassword,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText),),
              SizedBox(height: 64.h,),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextManager.newPassword,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText),),
              SizedBox(height: 8.h,),
              const CustomTextFormField(textHint: TextManager.password, prefixIcon: Icons.confirmation_num,isPrefix: false),
              SizedBox(height: 24.h,),
              Text(TextManager.repeatNewPassword,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText),),
              SizedBox(height: 8.h,),
              const CustomTextFormField(textHint: TextManager.password, prefixIcon: Icons.confirmation_num,isPrefix: false,),
              SizedBox(height: 48.h,),
              CustomElevatedButton(text: TextManager.setNewPassword2, onPressed: (){
                context.push((AppRouter.congratsScreen));
              },)

            ],
          ),
        )
      ],
    );
  }
}
