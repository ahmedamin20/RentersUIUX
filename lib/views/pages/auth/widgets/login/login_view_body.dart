import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/helpers/cach_helpers/cach_helpers.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/views/componants/custom_logo/custom_logo.dart';
import 'package:ksb/views/pages/auth/widgets/login/login_form_body.dart';
import 'package:ksb/views/pages/auth/widgets/login/login_buttons.dart';

import '../../../../../view_model/cubit/auth_cubit/cubit/login_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getDataString(key: "email"));

    LoginCubit.get(context).emailController.text =
        CacheHelper.getDataString(key: "email") ?? "";
    LoginCubit.get(context).passwordController.text =
        CacheHelper.getDataString(key: "password") ?? "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200.h, maxWidth: 200.w),
              child: const CustomLogoWidget()),
        ),
        Text(
          TextManager.welcomeBackToRenter.tr(),
          style: TextStyleManager.textStyle20w600
              .copyWith(color: ColorsManager.white),
        ),
        Text(TextManager.pleaseSignInWithYourMail.tr(),
            style: TextStyleManager.textStyle12w500),
        const LoginFormBody(),
        SpaceManager.sizedBox12h(context),
        const LogInButtons(),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                context.push(AppRouter.resetPasswordView);
              },
              child: Text(
                TextManager.forgetPassword.tr(),
                style: TextStyleManager.textStyle12w700.copyWith(
                  color: Colors.white,
                ),
              )),
        ),
        Center(
          child: TextButton(
              onPressed: () {
                context.push(AppRouter.signupView);
              },
              child: Text(
                TextManager.signUpDonotHaveAccount.tr(),
                style: TextStyleManager.textStyle12w700.copyWith(
                  color: Colors.white,
                ),
              )),
        ),
      ],
    );
  }
}
