import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../core/services/app_router.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h,),
           Center(
               child: SizedBox(
        
                   child: Image.asset(
                       'assets/images/logo_a.png',
                     width: 250.w,
                     height: 250.h,
                     fit: BoxFit.cover,
                   ))),
            SizedBox(height: 20.h,),
            SizedBox(
              width: 327.w,
              child:  Text(
                TextManager.eatingDrinking,
                textAlign: TextAlign.center,
                style: TextStyleManager.textStyle20w600
                ),
              ),
            SizedBox(height: 16.h,),
            SizedBox(
              width: 327,
              child: Text(
                TextManager.loginOrSignUp,
                textAlign: TextAlign.center,
                style:TextStyleManager.textStyle16w500.copyWith(color: ColorsManager.colorText) ,
              ),
            ),
        
            SizedBox(height: 100.h,),
            InkWell(
              onTap: ()
              {
                context.push(AppRouter.loginView);
              },
              child: Container(
                width: 343.w,
                padding:  EdgeInsets.symmetric(horizontal: 77.w, vertical: 14.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: ColorsManager.primaryColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      TextManager.logIn,
                      textAlign: TextAlign.center,
                      style: TextStyleManager.textStyle16w500,
                    ),
                  ],
                ),
              ),
            ),
        
            SizedBox(height: 38.h,),
            ElevatedButton(
                onPressed: ()
                {
                  context.push(AppRouter.signupView);
        
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.primaryColor, fixedSize: Size(343.w, 48.h)),
                child: Text(
                  TextManager.signUp,
                  style:TextStyleManager.textStyle16w500.copyWith(color: Colors.white) ,
                )),
          ],
        ),
      ),
    );
  }
}
