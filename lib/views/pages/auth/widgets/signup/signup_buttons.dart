import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/view_model/cubit/auth_cubit/register_cubit/cubit/register_cubit_cubit.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_outlind_social_button.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';

class SignupButtons extends StatelessWidget {
  const SignupButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
          color: ColorsManager.white,
          textColor: ColorsManager.primaryColor,
          text: TextManager.signUp.tr(), onPressed: ()
        {
          if(RegisterCubitCubit.get(context).formKeyRegister.currentState!.validate())
          {
          RegisterCubitCubit.get(context).register();
          }else
          {
            customSnackBar(message: TextManager.pleaseFillAllOfData.tr(), snackBarType: SnackBarType.error, context: context);
          }
        }),
        
      
      ],
    );
  }
}
