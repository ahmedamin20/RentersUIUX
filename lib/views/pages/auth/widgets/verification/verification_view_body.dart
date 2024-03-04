import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/auth_cubit/verify_cubit/verify_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:ksb/views/componants/custom_text_body_widget.dart';
import 'package:ksb/views/pages/auth/widgets/verification/custom_otp_text_field.dart';
import 'package:ksb/views/pages/auth/widgets/verification/verification_buttons.dart';

import '../../../../../core/services/app_router.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({
    super.key,
    required this.email
  });
 final String email;

  @override
  Widget build(BuildContext context)
  {

    return BlocListener<VerifyCubit, VerifyState>(
      listener: (context, state)
      {
        switch(state)
        {
          case VerifyEmailLoading():
            customEasyLoading();
            break;
          case VerifyEmailSuccess():
            EasyLoading.dismiss();
             customSnackBar(message: TextManager.verifyAccountSuccessfully.tr(),
            snackBarType: SnackBarType.success, context: context);

            context.go(AppRouter.loginView);
            break;
          case VerifyEmailError():
            EasyLoading.dismiss();
            customSnackBar(message: state.error, snackBarType: SnackBarType.error, context: context);
            break;
            case ResendVerifyEmailLoading():
                customEasyLoading();
            break;
            case ResendVerifyEmailSuccess():
              EasyLoading.dismiss();
              customSnackBar(message: TextManager.resendVerifyAccountSuccessfully.tr(),
                  snackBarType: SnackBarType.success, context: context);
              break;
            case ResendVerifyEmailError():
              EasyLoading.dismiss();
              customSnackBar(message: state.error, snackBarType: SnackBarType.error, context: context);
              break;





        }
        // TODO: implement listener
      },
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            Image.asset(AssetsManager.verification),
            SpaceManager.sizedBox32h(context),
            const CustomTextBodyWidget(
                textAlign: TextAlign.center,
                titleText: TextManager.almostThere,
                bodyText: TextManager.verificationbody),
            SpaceManager.sizedBox24h(context),
            Text(email , style:  TextStyleManager.textStyle16w500.copyWith(color:ColorsManager.gray),),
            SpaceManager.sizedBox24h(context),

             CustomOtpTextField( onCompleted: (pin){
              VerifyCubit.get(context).code = pin;
            }),
            const Spacer(),
             VerificationButtons(email: email,)
          ],
        ),
      ),
    );
  }
}
