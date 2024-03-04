import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/custom_Auth_App_bar.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/widget/reset_password_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAuthAppBar(),
      body:  CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child:  ResetPasswordWidget(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child:Center(child: Padding(
              padding:  EdgeInsets.only(bottom: 40.h),
              child: InkWell(
                  onTap: (){
                    context.push((AppRouter.loginView));
                  },
                  child: Text(TextManager.returnTOLogin,style: TextStyleManager.textStyle14w500.copyWith(color: ColorsManager.colorBlue),)),
            )) ,
          )
        ],
      ),
    );
  }
}
