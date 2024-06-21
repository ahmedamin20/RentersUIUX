import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/views/componants/custom_logo/custom_logo.dart';
import 'package:ksb/views/componants/custom_text_Button.dart';
import 'package:ksb/views/pages/auth/widgets/signup/signup_buttons.dart';
import 'package:ksb/views/pages/auth/widgets/signup/signup_form_body.dart';
import 'package:ksb/views/pages/auth/widgets/signup/termes_and_policy.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
             
                    Center(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200.h, maxWidth: 200.w),
              child: const CustomLogoWidget()),
        ),
              const SignupFormBody(),
              SpaceManager.sizedBox12h(context),
              
              // const TermsAndPolicy(),
              SpaceManager.sizedBox12h(context),
              const SignupButtons(),
              // const Spacer(),
              Text.rich(
                TextSpan(children: <InlineSpan>[
                  TextSpan(
                    text: TextManager.bySigningUpYouAgree.tr(),
                    style: TextStyleManager.textStyle12w500.copyWith(),
                  ),
                  TextSpan(
                      text: TextManager.termsAndConditions.tr(),
                      style: TextStyleManager.textStyle12w700
                          .copyWith(color: Colors.blue)),
                ]),
              )

            ],
          ),
        ),
      ),
    );
  }
}
