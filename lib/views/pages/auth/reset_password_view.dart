import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/data/repository/reset_password_repo/reset_password_repo.dart';
import 'package:ksb/view_model/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/custom_Auth_App_bar.dart';
import 'package:ksb/views/pages/auth/widgets/reset_password/reset_password_view_body.dart';
import '../../../core/services/app_router.dart';
import '../../../core/services/service_locator/service_locator.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(sl<ResetPasswordRepoImpl>()),
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state)
        {
          if(state is ForgetPasswordLoadingState)
            {
              customEasyLoading();

            }
          else if(state is ForgetPasswordSuccessState)
            {
              EasyLoading.dismiss();

              customSnackBar(message: state.message, snackBarType: SnackBarType.success, context: context);
              context.push(AppRouter.createNewPassowrdView , extra:
              {
                "email" : ResetPasswordCubit.get(context).emailController.text,
                "cubit" : ResetPasswordCubit.get(context),
              });

            }
          else if(state is ForgetPasswordErrorState)
            {
              EasyLoading.dismiss();
              customSnackBar(message: state.error, snackBarType: SnackBarType.error, context: context);

              // Custom
            }
          // TODO: implement listener
        },
        child:  const Scaffold(
          appBar: CustomAuthAppBar(),
          body: SingleChildScrollView(child: ResetPasswordViewBody()),
        ),
      ),
    );
  }
}
