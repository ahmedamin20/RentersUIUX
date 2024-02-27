import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/services/service_locator/service_locator.dart';
import 'package:ksb/view_model/cubit/auth_cubit/register_cubit/cubit/register_cubit_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';

import 'package:ksb/views/pages/auth/widgets/auth_app_bar.dart';

import 'package:ksb/views/pages/auth/widgets/signup/signup_view_body.dart';

import '../../../core/services/app_router.dart';
import '../../../data/repository/register_repo/register_repo.dart';
import 'antoneos_auth/custom_Auth_App_bar.dart';

class SignupView extends StatelessWidget
{
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubitCubit(sl<RegisterRepoImpl>()),
      child: BlocListener<RegisterCubitCubit, RegisterCubitState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            customEasyLoading();
          } else if (state is RegisterSuccessfulyState) {
            EasyLoading.dismiss();
            customSnackBar(
                message: TextManager.createAccountSuccessfuly.tr(),
                snackBarType: SnackBarType.success,
                context: context);
            context.push(
                AppRouter.verificationView ,
                 extra:
                {
                "email" : RegisterCubitCubit.get(context).emailController.text.trim(),
                }
            );
          } else if (state is RegisterErrorState)
          {
            EasyLoading.dismiss();
            customSnackBar(
                message: state.message,
                snackBarType: SnackBarType.error,
                context: context);
          }
        },

        child:  SafeArea(
          child: const Scaffold(
            // resizeToAvoidBottomInset: false,
            appBar:CustomAuthAppBar(),
            body: SignupViewBody(),
          ),
        ),
      ),
    );
  }
}
