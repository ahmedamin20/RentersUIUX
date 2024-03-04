import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/helpers/cach_helpers/cach_helpers.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/views/componants/custom_text_Button.dart';
import 'package:ksb/views/componants/custom_text_body_widget.dart';
import 'package:ksb/views/pages/auth/widgets/login/login_form_body.dart';
import 'package:ksb/views/pages/auth/widgets/login/login_buttons.dart';

import '../../../../../view_model/cubit/auth_cubit/cubit/login_cubit.dart';

class LoginViewBody extends StatelessWidget
{
  const LoginViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) 
  {
    print(CacheHelper.getDataString(key: "email"));

    LoginCubit.get(context).emailController.text = CacheHelper.getDataString(key: "email") ?? "";
    LoginCubit.get(context).passwordController.text = CacheHelper.getDataString(key: "password")?? "";
    return Column(
      children: [
        SizedBox(height: 20.h,),

        Text(
          TextManager.loginIn.tr(),
          style: TextStyleManager.textStyle20w600.copyWith(
            color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.grayDark,
          ),
        ),
        SizedBox(height: 24.h,),

        const LoginFormBody(),

        SpaceManager.sizedBox24h(context),

        const LogInButtons(),


        SpaceManager.sizedBox40h(context),

        TextButton(onPressed: ()
        {
          context.push(AppRouter.resetPasswordView);
        }, child: Text(TextManager.forgetPassword.tr(),
          style: TextStyleManager.textStyle12w700.copyWith(
            color:Colors.blue,),)),
        TextButton(onPressed: ()
        {
          context.push(AppRouter.signupView);
        }, child: Text(TextManager.signUp.tr(),
          style: TextStyleManager.textStyle12w700.copyWith(
            color:Colors.blue,),)),


      ],
    );
  }
}
