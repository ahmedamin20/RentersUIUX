import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../componants/custom_text_form_field.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
        child:
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextManager.name,style: TextStyleManager.textStyle12w400,),
              SizedBox(height: 8.h,),
              const CustomTextFormField(textHint: 'Ulvin',isPrefix: false,),
              SizedBox(height: 24.h,),
              Text(TextManager.surName,style: TextStyleManager.textStyle12w400,),
              SizedBox(height: 8.h,),
              const CustomTextFormField(textHint: 'Omarov',isPrefix: false,),
              SizedBox(height: 24.h,),
              Text(TextManager.email,style: TextStyleManager.textStyle12w400,),
              SizedBox(height: 8.h,),
              const CustomTextFormField(textHint: 'ulvinoma |',isPrefix: false,),
              SizedBox(height: 24.h,),
              Text(TextManager.phone,style: TextStyleManager.textStyle12w400,),
              SizedBox(height: 8.h,),
              const CustomTextFormField(textHint: '+1 345 678 900 24',isPrefix: false,),
              SizedBox(height: 8.h,),
              Text(TextManager.firstAdd,style: TextStyleManager.textStyle12w400.copyWith(color: ColorsManager.gray2),)
            ],
          ),
        ));
  }
}
