import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/constants.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/data/repository/change_password_repo/change_password_repo.dart';
import 'package:ksb/view_model/cubit/change_password_cubit/change_password_cubit.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';

import '../../../../core/services/service_locator/service_locator.dart';
import '../../../../view_model/cubit/layout_cubit/layout_cubit.dart';
import '../../../componants/custom_elevated_button.dart';
import '../components/custom_text_form_edit_profile/custom_text_form_edit_profile.dart';
import '../components/header_profile_widget/header_profile_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangePasswordCubit(sl<ChangePasswordRepoImpl>()),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is ChangePasswordLoadingState)
            {
              customEasyLoading();
            }else if(state is ChangePasswordSuccessState)
              {
                EasyLoading.dismiss();
                customSnackBar(message: "Change Password Successfully",
                    snackBarType: SnackBarType.success, context: context);
              }else if(state is ChangePasswordErrorState)
                {
                  EasyLoading.dismiss();
                  customSnackBar(message: state.error,
                      snackBarType: SnackBarType.error, context: context);
                }
        },
        builder: (context, state) {
          ChangePasswordCubit cubit = ChangePasswordCubit.get(context);
          return Scaffold(
            bottomSheet: Container(
              color: LayoutCubit.get(context).isDark?ColorsManager.blackColor: ColorsManager.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: ()
                    {
                      cubit.changePassword(
                        confirmPassword: cubit.confirmPasswordController.text,
                        newPassword: cubit.newPasswordController.text,
                        oldPassword: cubit.oldPasswordController.text,
                        );
                      // if(cubit.formKey.currentState!.validate())
                      // {
                      //   cubit.updateProfileData();
                      // }
                    },
                    text: "Save".tr(),
                  ),
                ),
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Column(
                  children:
                  [
                    HeaderProfileWidget
                      (
                      isProfile: false,
                      titlePage: "Change Password".tr(),
                      userModel: ProfileCubit
                          .get(context)
                          .userModel!,
                      image: ProfileCubit
                          .get(context)
                          .userModel!
                          .avatar,

                    ),
                    SizedBox(
                      height: 25.h,
                    ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18.0),
                 child: Column(children:
                 [
                   Padding(
                     padding: EdgeInsets.only(bottom: 16.0.h),
                     child: CustomTextFormEditProfile(
                       suffixIcon:   cubit.changePasswordVisibility ? Icons.visibility_rounded:Icons.visibility_off_outlined,
                       changePasswordVisibility: () {
                         print("Amr");
                         cubit.changePasswordVisibility = !cubit.changePasswordVisibility;
                          cubit.emit(ChangePasswordVisibilityState());
                       },
                       obscureText:  cubit.changePasswordVisibility,
                       title: "Old Password".tr(),
                       iconData: Icons.lock,
                       textHint: "**********",
                       controller: cubit.oldPasswordController,
                       validator: (value) {
                         if (!passwordRegex.hasMatch(value)) {
                           return "Please Enter Your Email";
                         }
                       },
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(bottom: 16.0.h),
                     child: CustomTextFormEditProfile(
                       obscureText:  cubit.changePasswordVisibility,
                       suffixIcon:   cubit.changePasswordVisibility ? Icons.visibility_rounded:Icons.visibility_off_outlined,
                       changePasswordVisibility: () {
                         print("Amr");
                         cubit.changePasswordVisibility = !cubit.changePasswordVisibility;
                         cubit.emit(ChangePasswordVisibilityState());
                       },
                       title: "New Password".tr(),
                       iconData: Icons.lock,
                       textHint: "**********",
                       controller: cubit.newPasswordController,
                       validator: (value) {
                         if (!passwordRegex.hasMatch(value)) {
                           return "Please Enter Your Email".tr();
                         }
                       },
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(bottom: 16.0.h),
                     child: CustomTextFormEditProfile(
                       suffixIcon:   cubit.changePasswordVisibility ? Icons.visibility_rounded:Icons.visibility_off_outlined,
                       changePasswordVisibility: () {
                         cubit.changePasswordVisibility = !cubit.changePasswordVisibility;
                         cubit.emit(ChangePasswordVisibilityState());
                       },
                       title: "Confirmation New Password".tr(),
                       obscureText:  cubit.changePasswordVisibility,
                       iconData: Icons.lock,
                       textHint: "**********",
                       controller: cubit.confirmPasswordController,
                       validator: (value) {
                         if (!passwordRegex.hasMatch(value)) {
                           return "Please Enter Your Email";
                         }
                       },
                     ),
                   ),
                 ],),
               )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
