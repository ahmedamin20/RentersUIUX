import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/caching_data/cacshing_date.dart';
import 'package:ksb/core/helpers/cach_helpers/cach_helpers.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/data/repository/login_repo/login_repo.dart';
import 'package:ksb/view_model/cubit/auth_cubit/cubit/login_cubit.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/custom_Auth_App_bar.dart';

import 'package:ksb/views/pages/auth/widgets/auth_app_bar.dart';
import 'package:ksb/views/pages/auth/widgets/login/login_view_body.dart';

import '../../../core/services/app_router.dart';
import '../../../core/services/service_locator/service_locator.dart';
import '../../componants/custom_easy_loading/custom_easy_loading.dart';
import '../../componants/custom_snack_bar/custom_snack_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(sl<LoginRepoImpl>()),
      child: Scaffold(
          backgroundColor: ColorsManager.primaryColor,
          // appBar:const CustomAuthAppBar(),
          resizeToAvoidBottomInset: false,
          // appBar: const AuthAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child:  BlocListener<LoginCubit, LoginState>
              (
                listener: (context, state)
                {
                  loginStates(state, context);
                },
                child:  const LoginViewBody(),

              ),
            ),
          ),
        ),
      
    );
  }

   loginStates(LoginState state, BuildContext context)  
  {
     if(state is LoginErrorState)
    {
      EasyLoading.dismiss();
      List errors = state.message.split(",");
      print(errors);
      bool isEmailVerified = false ;

      // if(state.code ==403)
      //   {
      //     isEmailVerified =   bool.parse(errors[0].toString().trim());
      //   }

      false ;
      if(isEmailVerified)
        {
          context.go(
              AppRouter.verificationView ,
          extra: {
            "email": LoginCubit.get(context).emailController.text,
          }
          );
          customSnackBar(
              context: context,
              message: errors[1],
              snackBarType: SnackBarType.error
          );
        }
      else{
        customSnackBar(
            context: context,
            message: state.message,
            snackBarType: SnackBarType.error
        );
      }

  
    }
    else if(state is LoginSuccessState)
    {
            EasyLoading.dismiss();
            print(LoginCubit.get(context).isRememberMe);
            print(LoginCubit.get(context).emailController.text);
            print(LoginCubit.get(context).passwordController.text);
            if(LoginCubit.get(context).isRememberMe)
            {
              CacheHelper.put(
                key: "email",
                value: LoginCubit.get(context).emailController.text,
              );
              CacheHelper.put(
                key: "password",
                value: LoginCubit.get(context).passwordController.text,
              );
            }

     CachingData.instance.cachLoginInfo(state.loginModel);
       customSnackBar(
        context: context,
        message: "Login Success".tr(),
        snackBarType: SnackBarType.success
      );
        context.go(AppRouter.homeLayOut);
    }
    else if(state is LoginLoadingState)
    {
    customEasyLoading();
    }
  }
}
