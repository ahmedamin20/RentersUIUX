import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/constants.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import '../../../../core/helpers/cach_helpers/cach_helpers.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/space_manager.dart';
import '../../../../core/services/app_router.dart';
import '../components/custom_card_profile/custom_card_profile.dart';
import '../components/custom_text_form_edit_profile/custom_text_form_edit_profile.dart';
import '../components/header_profile_widget/header_profile_widget.dart';

class ProfileSettingScreen extends StatelessWidget
{
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCubit
        .get(context)
        .emailController = TextEditingController(text: ProfileCubit
        .get(context)
        .userModel!
        .email);
    ProfileCubit
        .get(context)
        .nameController = TextEditingController(text: ProfileCubit
        .get(context)
        .userModel!
        .name);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileDataLoadingState) {
          customEasyLoading();
        } else if (state is UpdateProfileDataSuccessState) {
          EasyLoading.dismiss();
          customSnackBar(
              message: "Update Profile Info Successfully",
              snackBarType: SnackBarType.success,
              context: context);
        } else if (state is UpdateProfileDataErrorState) {
          EasyLoading.dismiss();
          customSnackBar(
              message: state.error,
              snackBarType: SnackBarType.error,
              context: context);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 70.h),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderProfileWidget(
                      isProfile: false,
                      userModel: cubit.userModel!,
                      image: cubit.imageUser(),
                      onTap: () async
                      {
                        cubit.selectImage();
                      },
                    ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 24.0),
                     child: Column(children:
                     [
                       SpaceManager.sizedBox24h(context),
                       Padding(
                         padding: EdgeInsets.only(bottom: 16.0.h),
                         child: CustomTextFormEditProfile(
                           title: "Full Name".tr(),
                           iconData: Icons.person,
                           textHint: "Enter Your Name".tr(),
                           controller: cubit.nameController,
                           validator: (value) {
                             if (!fullNameRegex.hasMatch(value)) {
                               return "Please Enter Your Full Name";
                             }
                           },
                         ),
                       ),
                       SpaceManager.sizedBox24h(context),
                       Padding(
                         padding: EdgeInsets.only(bottom: 16.0.h),
                         child: CustomTextFormEditProfile(
                           title: "Your Email".tr(),
                           iconData: Icons.email,
                           textHint: "Enter Email",
                           controller: cubit.emailController,
                           validator: (value) {
                             if (!emailRegex.hasMatch(value)) {
                               return "Please Enter Your Email";
                             }
                           },
                         ),
                       ),
                       SpaceManager.sizedBox24h(context),
                       CustomCardProfile(
                         title: "Delete Account".tr(),
                         color: ColorsManager.redColor,
                         backGroundButton: ColorsManager.redColor,
                         textColor: ColorsManager.white,
                         arrowColor: ColorsManager.white,

                         onTap: () {
                           showDialog(context: context, builder: (context) {
                             return ClipRRect(
                               borderRadius: BorderRadius.circular(100.r),
                               child: AlertDialog(
                                 backgroundColor: LayoutCubit.get(context).isDark?ColorsManager.grayDark:ColorsManager.white,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(20.r)),
                                 title:  Text("Delete Account".tr(),style:TextStyleManager.textStyle18w700.copyWith(
                                     color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.blackColor

                                 )
                                   ,),
                                 content: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children:
                                   [
                                     BlocConsumer<ProfileCubit, ProfileState>(
                                       listener: (context, state)
                                       {
                                         if(state is DeleteAccountLoadingState)
                                         {
                                           customEasyLoading();
                                         }else if(state is DeleteAccountSuccessState)
                                         {
                                           EasyLoading.dismiss();
                                           customSnackBar(
                                               message: "Delete Account Successfully".tr(),
                                               snackBarType: SnackBarType.success,
                                               context: context);
                                           CacheHelper.clearData();
                                           context.go(AppRouter.loginView);
                                         }else if(state is DeleteAccountErrorState)
                                         {
                                           EasyLoading.dismiss();
                                           customSnackBar(
                                               message: state.error,
                                               snackBarType: SnackBarType.error,
                                               context: context);
                                         }
                                         // TODO: implement listener
                                       },
                                       builder: (context, state) {
                                         return CustomTextFormField
                                           (
                                           controller: cubit
                                               .currentPasswordController,
                                           textHint: '************',
                                           prefixIcon: Icons.lock,
                                           colorDark: ColorsManager.blackColor,
                                           obscureText: cubit.isPassword,
                                           suffixIcon: cubit.isPassword ? Icons
                                               .visibility : Icons
                                               .visibility_off,
                                           changePasswordVisibility: () {
                                             cubit.isPassword =
                                             !cubit.isPassword;
                                             cubit.emit(
                                                 ProfileChangePasswordVisibilityState());
                                           },
                                         );
                                       },
                                     ),
                                     SizedBox(height: 10.h,),
                                     SizedBox(
                                       width: double.infinity,
                                       child: CustomElevatedButton(
                                           color: ColorsManager.redColor,
                                           text: "Delete Account".tr(),
                                           onPressed: () {
                                             if (cubit.currentPasswordController
                                                 .text.isNotEmpty) {
                                               cubit.deleteAccount();
                                             }else{
                                               customSnackBar(
                                                   message: "Please Enter Your Password".tr(),
                                                   snackBarType: SnackBarType.error,
                                                   context: context);
                                             }
                                           }),
                                     ),
                                   ],
                                 ),

                               ),
                             );
                           },);
                         }, iconData: '',
                       ),
                     ],),
                   )
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            color: LayoutCubit.get(context).isDark?ColorsManager.blackColor:ColorsManager.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.updateProfileData();
                    }
                  },
                  text: "Save".tr(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
