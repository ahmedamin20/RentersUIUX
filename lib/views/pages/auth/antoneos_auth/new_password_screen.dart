import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/custom_Auth_App_bar.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/widget/new_password_widget.dart';

import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../core/services/app_router.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAuthAppBar(),
      body:  CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: NewPasswordWidget(),
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
