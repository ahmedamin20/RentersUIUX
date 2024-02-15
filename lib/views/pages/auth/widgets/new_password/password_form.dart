import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';

import '../../../../../view_model/cubit/reset_password_cubit/reset_password_cubit.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFormField(
              textHint: TextManager.password.tr(),
              prefixIcon: Icons.lock_outline,
              controller: ResetPasswordCubit
                  .get(context)
                  .passwordController,
              suffixIcon:  ResetPasswordCubit
                  .get(context)
                  .isPassword ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,

              changePasswordVisibility: ()
              {
                ResetPasswordCubit
                    .get(context)
                    .isPassword =!ResetPasswordCubit
                    .get(context)
                    .isPassword;
                ResetPasswordCubit.get(context).emit(ResetPasswordChangePasswordVisibilityState());
              },
              obscureText: ResetPasswordCubit
                  .get(context)
                  .isPassword,
            ),
            SpaceManager.sizedBox16h(context),
            CustomTextFormField(
              changePasswordVisibility: () {
                ResetPasswordCubit
                    .get(context)
                    .isPassword =!ResetPasswordCubit
                    .get(context)
                    .isPassword;
                ResetPasswordCubit.get(context).emit(ResetPasswordChangePasswordVisibilityState());

              },
              obscureText: ResetPasswordCubit
                  .get(context)
                  .isPassword,

              textHint:  "confirm password".tr(),
              prefixIcon: Icons.lock_outline,
              controller: ResetPasswordCubit
                  .get(context)
                  .confirmPasswordController,
              suffixIcon:  ResetPasswordCubit
                  .get(context)
                  .isPassword ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
            ),
          ],
        );
      },
    );
  }
}
