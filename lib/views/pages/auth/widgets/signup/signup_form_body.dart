import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ksb/core/constants.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/view_model/cubit/auth_cubit/register_cubit/cubit/register_cubit_cubit.dart';

import '../../../../../core/resource/text_style_manager.dart';
import '../../../../componants/custom_text_form_field.dart';

class SignupFormBody extends StatefulWidget {
  const SignupFormBody({super.key});

  @override
  State<SignupFormBody> createState() => _SignupFormBodyState();
}

class _SignupFormBodyState extends State<SignupFormBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubitCubit, RegisterCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
          key: RegisterCubitCubit.get(context).formKeyRegister,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () =>
                      context.read<RegisterCubitCubit>().pickImageAvatar(true),
                  child: Center(
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.white,
                      child: context.read<RegisterCubitCubit>().avatar != null
                          ? Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50.r,
                                  backgroundImage: FileImage(File(context
                                      .read<RegisterCubitCubit>()
                                      .avatar!
                                      .path)),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      context
                                          .read<RegisterCubitCubit>()
                                          .avatar = null;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          : Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: 50.w,
                            ),
                    ),
                  ),
                ),
                Text(
                  TextManager.name,
                  style: TextStyleManager.textStyle12w700,
                ),
                SpaceManager.sizedBox12h(context),

                CustomTextFormField(
                  textHint: TextManager.fullName.tr(),
                  prefixIcon: Icons.person_outline_outlined,
                  controller:
                      RegisterCubitCubit.get(context).fullNameController,
                  obscureText: false,
                  validator: (p0) {
                    if (!fullNameRegex.hasMatch(p0!)) {
                      return TextManager.pleaseEnterYourFullName.tr();
                    }
                    return null;
                  },
                ),
                SpaceManager.sizedBox16h(context),

                Text(
                  TextManager.email,
                  style: TextStyleManager.textStyle12w700,
                ),
                SpaceManager.sizedBox12h(context),

                CustomTextFormField(
                  textHint: TextManager.exampleEmail.tr(),
                  prefixIcon: Icons.email_outlined,
                  obscureText: false,
                  controller: RegisterCubitCubit.get(context).emailController,
                  validator: (p0) => p0!.isEmpty
                      ? TextManager.pleaseEnterValidEmail.tr()
                      : !emailRegex.hasMatch(p0)
                          ? TextManager.pleaseEnterValidEmail.tr()
                          : null,
                ),
                SpaceManager.sizedBox16h(context),
                Text(
                  "Address",
                  style: TextStyleManager.textStyle12w700,
                ),
                SpaceManager.sizedBox12h(context),

                CustomTextFormField(
                  textHint: "Enter your address",
                  prefixIcon: Icons.email_outlined,
                  obscureText: false,
                  controller: RegisterCubitCubit.get(context).addressController,
                ),
                SpaceManager.sizedBox16h(context),

                Text(
                  TextManager.phone,
                  style: TextStyleManager.textStyle12w700,
                ),
                SpaceManager.sizedBox16h(context),

                CustomTextFormField(
                  textHint: TextManager.ex_phone.tr(),
                  prefixIcon: Icons.location_on_outlined,
                  controller: RegisterCubitCubit.get(context).phoneController,
                  validator: (p0) => p0!.isEmpty
                      ? TextManager.pleaseEnterValidAddress.tr()
                      : null,
                ),
                SpaceManager.sizedBox16h(context),

                Text(
                  TextManager.password,
                  style: TextStyleManager.textStyle12w700,
                ),
                SpaceManager.sizedBox12h(context),

                CustomTextFormField(
                  textHint: TextManager.password.tr(),
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.remove_red_eye_outlined,
                  controller:
                      RegisterCubitCubit.get(context).passwordController,
                  obscureText: true,
                ),
                SpaceManager.sizedBox16h(context),
                Text(
                  "Front ID",
                  style: TextStyleManager.textStyle12w700,
                ),
                SpaceManager.sizedBox12h(context),
                InkWell(
                  onTap: () {
                    context.read<RegisterCubitCubit>().pickImage(true);
                  },
                  child: Container(
                    height: 100.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: context.read<RegisterCubitCubit>().frontID != null
                        ? Center(
                            child: Stack(
                              children: [
                                Image(
                                    image: FileImage(File(context
                                        .read<RegisterCubitCubit>()
                                        .frontID!
                                        .path))),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      context
                                          .read<RegisterCubitCubit>()
                                          .frontID = null;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: 50.w,
                          ),
                  ),
                ),
                SpaceManager.sizedBox12h(context),

                Text(
                  "Back ID",
                  style: TextStyleManager.textStyle12w700,
                ),
                SpaceManager.sizedBox12h(context),
                InkWell(
                  onTap: () {
                    context.read<RegisterCubitCubit>().pickImage(false);
                  },
                  child: Container(
                    height: 100.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: context.read<RegisterCubitCubit>().backID != null
                        ? Center(
                            child: Stack(
                              children: [
                                Image(
                                    image: FileImage(File(context
                                        .read<RegisterCubitCubit>()
                                        .backID!
                                        .path))),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      context
                                          .read<RegisterCubitCubit>()
                                          .backID = null;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: 50.w,
                          ),
                  ),
                )

                // CustomTextFormField(
                //   textHint: TextManager.phone.tr(),
                //   prefixIcon: Icons.phone_android_outlined,
                //   controller: RegisterCubitCubit.get(context).phoneController,
                //   validator: (p0) => p0!.isEmpty
                //       ? TextManager.pleaseEnterYourPhone.tr()
                //       : !phoneRegex.hasMatch(p0)
                //           ? TextManager.pleaseEnterYourPhone.tr()
                //           : null,
                // ),
                // IntlPhoneField(
                //   decoration: InputDecoration(
                //     labelText: 'Phone Number',
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide(),
                //     ),
                //   ),
                //   initialCountryCode: 'CI',
                //   onChanged: (phone) {
                //     print(phone.completeNumber!);
                //     RegisterCubitCubit.get(context).phoneController.text = phone.completeNumber!;
                //   },
                // ),
                // InternationalPhoneNumberInput(
                //   onInputChanged: (PhoneNumber number) {
                //     print(number.phoneNumber!);
                //     RegisterCubitCubit.get(context).phoneController.text = number.phoneNumber!;
                //
                //   },
                //   onInputValidated: (bool value) {
                //     // RegisterCubitCubit.get(context).phoneController.text  = value;
                //   },
                //   selectorConfig: const SelectorConfig(
                //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                //   ),
                //   ignoreBlank: false,
                //   // autoValidateMode: AutovalidateMode.disabled,
                //   selectorTextStyle: const TextStyle(color: Colors.black),
                //   initialValue: PhoneNumber(isoCode: 'CI' , phoneNumber: '+225'),
                //   // textFieldController:
                //   //     RegisterCubitCubit.get(context).phoneController,
                //   formatInput: false,
                //   keyboardType: const TextInputType.numberWithOptions(
                //       signed: true, decimal: true),
                //   inputBorder: const OutlineInputBorder(),
                //   onSaved: (PhoneNumber number)
                //   {
                //     print(number.phoneNumber!);
                //     RegisterCubitCubit.get(context).phoneController.text = number.phoneNumber!;
                //   },
                // ),
              ]),
        );
      },
    );
  }
}
