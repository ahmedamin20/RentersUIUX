import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/auth_cubit/cubit/login_cubit.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/validation/validation.dart';

class LoginFormBody extends StatelessWidget {
  const LoginFormBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Form(
      key: loginCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceManager.sizedBox24h(context),
          Text(
            TextManager.email.tr(),
            style: TextStyleManager.textStyle12w500.copyWith(
              color: Colors.black,
            )
          ),

          SpaceManager.sizedBox24h(context),

          CustomTextFormField(
            // validator: (value) {
            //   if (!Regexp.isValidEmail(value!)) {
            //     return TextManager.pleaseEnterValidEmail.tr();
            //   }
            //   return null;
            // },
            textHint: TextManager.email.tr(),
            obscureText: false,
            controller: loginCubit.emailController,
          ),
          SpaceManager.sizedBox24h(context),

          Text(
              TextManager.password.tr(),
              style: TextStyleManager.textStyle12w500.copyWith(
                color: Colors.black,
              )
          ),
          SpaceManager.sizedBox16h(context),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextFormField(
                textHint: TextManager.password.tr(),
                suffixIcon: context.read<LoginCubit>().isPassword ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
                obscureText: context.read<LoginCubit>().isPassword,
                changePasswordVisibility: () {
                  context.read<LoginCubit>().changePasswordState();
                },
                validator: (value) 
                {
                  if (value!.isEmpty) {
                    return TextManager.passwordIsRequired.tr();
                  }
                  return null;
                },
                controller: loginCubit.passwordController,
              );
            },
          ),
          SpaceManager.sizedBox16h(context),
        ],
      ),
    );
  }
}
