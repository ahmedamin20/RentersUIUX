import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/helpers/facebook_helpers/facebook_helpers.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/view_model/cubit/auth_cubit/cubit/login_cubit.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_outlind_social_button.dart';

import '../../../../../core/services/app_router.dart';

class LogInButtons extends StatelessWidget {
  const LogInButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
        CustomElevatedButton(
            text: TextManager.signIn.tr(),
            color: ColorsManager.white,
            textColor: ColorsManager.primaryColor,
            onPressed: () {
           LoginCubit.get(context).loginWithEmailAndPassword();
            });    
  }
}
