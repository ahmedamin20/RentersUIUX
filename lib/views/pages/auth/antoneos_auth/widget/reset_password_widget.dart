import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/pages/auth/widgets/verification/custom_otp_text_field.dart';

import '../../../../../core/services/app_router.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key});


  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  int ?resendTime;

  late Timer countdownTimer;
  void startTimer(){
    resendTime=60;
    countdownTimer=Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime !> 0) {
        setState(() {
          resendTime = resendTime! - 1;
        });
      }
      if (resendTime! < 1) {
        setState(() {
          countdownTimer.cancel();
        });
      }
    });
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Text(TextManager.resetCode,
                style: TextStyleManager.textStyle24w600.copyWith(color: ColorsManager.colorText),),
              SizedBox(height: 24.h,),
              Text("${TextManager.weSentCode} aaaa",style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText),),
              SizedBox(height: 40.h,),
              Padding(
                padding:  EdgeInsets.only(left: 58.w,right: 58.w),
                child: CustomOtpTextField(onCompleted: (){}),
              ),
              SizedBox(height: 24.h,),
              Text(TextManager.didntGetCode,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),),
              SizedBox(height: 8.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  resendTime!=0? Text('${resendTime.toString()} s' , style: TextStyleManager.textStyle14w500.copyWith(color: ColorsManager.colorBlue)):
                  const SizedBox(),
                  SizedBox(width: 8.w,),
                  InkWell(
                      onTap: (){
                        startTimer();
                      },
                      child:    resendTime==0?Text(TextManager.resend,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),):const SizedBox()),
                ],
              ),
              const SizedBox(),
              SizedBox(height: 94.h,),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w),
          child: CustomElevatedButton(text: TextManager.confirm, onPressed: (){
            context.push((AppRouter.newPassword));
          },),
        ),
        SizedBox(height: 203.h,),

      ],
    );
  }
}
