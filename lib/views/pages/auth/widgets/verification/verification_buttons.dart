import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/view_model/cubit/auth_cubit/verify_cubit/verify_cubit.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_outlind_button.dart';

class VerificationButtons extends StatelessWidget {
  const VerificationButtons({
    super.key,
   required this.email
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
            text: TextManager.containue,
            onPressed: ()
            {
              VerifyCubit.get(context).
              verifyEmail(email: email);
              // context.go(AppRouter.pickInterestView);
            }),
        SpaceManager.sizedBox16h(context),
        CustomOutLinedButton(
          onPressed: () {
            VerifyCubit.get(context).
            resendVerifyCodeToEmail
              (email: email);
          },
          text: TextManager.resendCode,
        ),
      ],
    );
  }
}
