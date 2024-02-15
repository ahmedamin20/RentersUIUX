import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_outlind_button.dart';

import '../../../../../view_model/cubit/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordButtons extends StatelessWidget {
  const ResetPasswordButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
            text: TextManager.resetPassword.tr(),
            onPressed: () {
              print('121212');

              context.push(AppRouter.sendCode);
              // ResetPasswordCubit.get(context).forgetPassword(
              //     email: ResetPasswordCubit.get(context).emailController.text);
            }),

        SpaceManager.sizedBox16h(context),
        // CustomOutLinedButton(
        //   onPressed: () {
        //     context.go(AppRouter.loginView);
        //   },
        //   text: TextManager.returnToSignIn.tr(),
        // ),
      ],
    );
  }
}
