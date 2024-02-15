import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:ksb/views/componants/custom_text_body_widget.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import 'package:ksb/views/pages/auth/widgets/reset_password/reset_password_buttons.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        children: [
          SpaceManager.sizedBox32h(context),
           CustomTextBodyWidget(
            textAlign: TextAlign.center,
            titleText: TextManager.forgetPassword.tr(),
            bodyText: TextManager.resetTitleBody.tr(),
          ),
          SpaceManager.sizedBox24h(context),

           CustomTextFormField(
            controller: ResetPasswordCubit.get(context).emailController,
            textHint: TextManager.email.tr(),
            prefixIcon: Icons.email_outlined,
            obscureText: false,
          ),
          SizedBox(
            height: 48.h,
          ),
          const ResetPasswordButtons(),
          SizedBox(
            height: 200.h,
          ),
          TextButton(onPressed: (){}, child: Text(
            TextManager.returnToLogin,
            style: TextStyleManager.textStyle14w400.copyWith(color: Colors.blue),
          ))
        ],
      ),
    );
  }
}
