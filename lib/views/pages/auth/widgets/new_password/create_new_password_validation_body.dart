import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:ksb/views/componants/custom_text_body_widget.dart';
import 'package:ksb/views/pages/auth/widgets/new_password/password_form.dart';
import 'package:ksb/views/pages/auth/widgets/new_password/validation_password.dart';

import '../../../../../view_model/cubit/reset_password_cubit/reset_password_cubit.dart';
import '../verification/custom_otp_text_field.dart';

class CreateNowPasswordViewBody extends StatelessWidget {
  const CreateNowPasswordViewBody
      ({
        super.key,
    required this.email,
      });
 final  String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24).r,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.stretch,
          children: [

            CustomTextBodyWidget(
                titleText: TextManager.createYourNewPassword.tr(),
                bodyText: TextManager.createNowPasswordbody.tr()),
            SpaceManager.sizedBox16h(context),
            Text(TextManager.enterOtp.tr(),
              style: TextStyleManager.textStyle16w500.copyWith(color: ColorsManager.gray),),
            SpaceManager.sizedBox24h(context),

            CustomOtpTextField( onCompleted: (pin)
            {
              ResetPasswordCubit.get(context).pin = pin;
            }),
            SpaceManager.sizedBox24h(context),
            const PasswordForm(),
            SpaceManager.sizedBox16h(context),
            // const ValidationPassword(),
            // const Spacer(),
            CustomElevatedButton(
              text: TextManager.createNewPassword.tr(),
              onPressed: ()
              {
                if(ResetPasswordCubit.get(context).pin!=null &&
                    ResetPasswordCubit.get(context).passwordController.text.isNotEmpty &&
                    ResetPasswordCubit.get(context).confirmPasswordController.text.isNotEmpty)
                  {
                    ResetPasswordCubit.get(context).resetPassword(
                      email: email,
                      passwordConfirmation: ResetPasswordCubit.get(context).passwordController.text,
                      password: ResetPasswordCubit.get(context).confirmPasswordController.text,
                      code: ResetPasswordCubit.get(context).pin!,
                    );
                  }else
                  {
                    customSnackBar(context: context,
                        message: TextManager.pleaseEnterAllFields.tr(),
                        snackBarType: SnackBarType.error);
                  }

                // openbottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // void openbottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //           top: Radius.circular(RadiusManager.r32),
  //         ),
  //       ),
  //       builder: (BuildContext context) {
  //         return Container(
  //           padding: EdgeInsets.all(24.r),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(RadiusManager.r32)),
  //           child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 Image.asset(
  //                   AssetsManager.changePassDone,
  //                   height: MediaQuery.of(context).size.width * 0.30,
  //                   fit: BoxFit.scaleDown,
  //                 ),
  //                 SpaceManager.sizedBox24h(context),
  //                 Text(
  //                   TextManager.passChanged.tr(),
  //                   textAlign: TextAlign.center,
  //                   style: TextStyleManager.textStyle12w500
  //                       .copyWith(color: ColorsManager.grayDark),
  //                 ),
  //                 SizedBox(
  //                   height: 8.h,
  //                 ),
  //                 Text(
  //                   TextManager.passChangedbody.tr(),
  //                   textAlign: TextAlign.center,
  //                   style: TextStyleManager.textStyle16w500.copyWith(
  //                       letterSpacing: 0.40.w,
  //                       height: 1.5.h,
  //                       color: ColorsManager.gray),
  //                 ),
  //                 const Spacer(),
  //                 CustomElevatedButton(
  //                     text: TextManager.returnToSignIn.tr(),
  //                     onPressed: ()
  //                     {
  //                     })
  //               ]),
  //         );
  //       });
  // }
}
