import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/data/repository/contact_us_repo/conatct_us_repo.dart';
import 'package:ksb/views/componants/a2z_custom_button.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';

import '../../../../../../core/utils/flutter_toast/flutter_toast.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/services/service_locator/service_locator.dart';
import '../../../../core/validation/validation.dart';
import '../../../../view_model/cubit/contact_us_cubit/contact_us_cubit.dart';


class ContactUsWidget extends StatefulWidget {
  const ContactUsWidget({super.key});

  @override
  State<ContactUsWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {


  @override
  void initState() {
    // // TODO: implement initState
    // emailController.text =
    // CachingDataManager.instance.getLoginModel().data!.user!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Form(
            key: ContactUsCubit.get(context).contactUsKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TextManager.haveProblem,
                      style: TextStyleManager.textStyle20w500),

                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextFormField(
                    controller: ContactUsCubit.get(context).nameController,
                    textHint: TextManager.name,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return TextManager.pleaseEnterName;
                      } else if (value!.length < 3) {
                        return TextManager.invalidUserName;
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: CustomTextFormField(
                      controller: ContactUsCubit.get(context).emailController,
                      textHint: TextManager.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextManager.pleaseEnterValidEmail;
                        } else  if (!Regexp.isValidEmail(value)) {
                          return TextManager.invalidMail;
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                  ),
                  CustomTextFormField(
                    controller: ContactUsCubit.get(context).phoneController,
                    textHint: TextManager.phone,
                    keyboardType: TextInputType.phone,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return TextManager.pleaseEnterYourPhone;
                      } else if (value.length < 6) {
                        return TextManager.invalidPhone;
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: CustomTextFormField(
                      controller:ContactUsCubit.get(context).messageController,
                      textHint: TextManager.message,
                      maxLines: 5,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return TextManager.pleaseEnterMessage;
                        } else if (value!.length < 3) {
                          return TextManager.messageShort;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BlocConsumer<ContactUsCubit, ContactUsState>(
                    listener: (context, state) {
                      if(state is ContactUsLoading){
                        customEasyLoading();
                      }
                      if (state is ContactUsSuccess) {
                        EasyLoading.dismiss();
                          customSnackBar(
                        message: state.contactUsModel.message.toString(),snackBarType: SnackBarType.success, context: context,);
                        ContactUsCubit.get(context).nameController.clear();
                          ContactUsCubit.get(context).phoneController.clear();
                          ContactUsCubit.get(context).messageController.clear();
                          ContactUsCubit.get(context).emailController.clear();
                      } else if (state is ContactUsError) {
                        EasyLoading.dismiss();
                        customSnackBar(
                            message: state.error,  snackBarType:  SnackBarType.error, context: context,);
                      }
                    },
                    builder: (context, state) {
                      ContactUsCubit cubit = ContactUsCubit.get(context);
                      return A2zCustomButton(
                        buttonName: TextManager.send,
                        onPressed: () {
                          if (ContactUsCubit.get(context).contactUsKey.currentState!.validate()) {
                            ContactUsCubit.get(context).contactUs();
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}