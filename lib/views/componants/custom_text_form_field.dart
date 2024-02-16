
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  final String textHint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool isPrefix;
  final String obscuringCharacter;

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function ? changePasswordVisibility;
  final Function ? onEditingComplete;
  final Color ? colorDark;
  final int ? maxLines;
  final TextInputType keyboardType;
  // add controller with cubit
  const CustomTextFormField(
      {super.key,
      required this.textHint,
       this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.validator,
      this.controller,
      this.changePasswordVisibility ,
        this.onEditingComplete, this.colorDark=ColorsManager.grayDark,
        this.maxLines=1,  this.isPrefix=false,  this.obscuringCharacter='*',  this.keyboardType=TextInputType.text,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: obscuringCharacter,
      style: TextStyleManager.textStyle14w500
          .copyWith( color:ColorsManager.gray2),

      controller: controller,
      cursorColor: ColorsManager.primaryColor,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onEditingComplete: ()
      {
        onEditingComplete!();
      },

      decoration: InputDecoration(

        prefixIcon:isPrefix?  Icon(
          prefixIcon,
          color:LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.gray,
        ):null,

        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(
                  suffixIcon,
                   color:LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.gray,
                ),
                onPressed: () {
                  // change password visibility
                  changePasswordVisibility!();
                },
              )
            : null,
        hintText: textHint,
        hintStyle: TextStyleManager.textStyle14w500
            .copyWith(color:LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.gray2),
        filled: true,
        fillColor: LayoutCubit.get(context).isDark?colorDark:ColorsManager.white,
        border: OutlineInputBorder(
          borderSide:const BorderSide(color: ColorsManager.textFormFieldColor),
          borderRadius: BorderRadius.circular(RadiusManager.r8,),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsManager.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(RadiusManager.r8),
        ),

        errorMaxLines: 2,
        disabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: ColorsManager.textFormFieldColor),
          borderRadius: BorderRadius.circular(RadiusManager.r8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.textFormFieldColor),
          borderRadius: BorderRadius.circular(RadiusManager.r8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: ColorsManager.redColor, width: 1),
          borderRadius: BorderRadius.circular(RadiusManager.r8),
        ),
      ),
    );
  }
}
