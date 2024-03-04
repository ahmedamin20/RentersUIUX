import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:ksb/views/pages/auth/widgets/auth_app_bar.dart';
import 'package:ksb/views/pages/auth/widgets/new_password/create_new_password_validation_body.dart';

import '../../../view_model/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'antoneos_auth/custom_Auth_App_bar.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key,
    required this.email,
    required this.cubit,
  });

  final String email;
  final ResetPasswordCubit cubit;

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>
        (
        listener: (context, state)
    {
      if (state is ResetPasswordLoadingState)
      {
        customEasyLoading();
      } else if (state is ResetPasswordErrorState)
      {
        EasyLoading.dismiss();
        customSnackBar(message: state.error,
            snackBarType: SnackBarType.error,
            context: context);
      } else if (state is ResetPasswordSuccessState)
    {
      EasyLoading.dismiss();
      customSnackBar(message: state.message,
          snackBarType: SnackBarType.success,
          context: context);
      context.go(AppRouter.loginView);

    }
          // TODO: implement listener
        },
        child: Scaffold(
          appBar: const CustomAuthAppBar(),
          body:  CreateNowPasswordViewBody(email: email),
        ),
      ),
    );
  }
}
