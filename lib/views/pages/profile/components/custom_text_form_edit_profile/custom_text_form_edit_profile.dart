import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resource/space_manager.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../../../componants/custom_text_form_field.dart';

class CustomTextFormEditProfile extends StatefulWidget {
  const CustomTextFormEditProfile(
      {super.key,
      required this.title,
      required this.iconData,
      required this.controller,
      required this.validator,
      required this.textHint,
      this.obscureText = false,
        this.suffixIcon,
        this.changePasswordVisibility
      });
  final String title;
  final IconData iconData;
  final TextEditingController controller;
  final Function(String) validator;
  final String textHint;
  final bool obscureText;
  final IconData ?suffixIcon;
  final Function()? changePasswordVisibility;

  @override
  State<CustomTextFormEditProfile> createState() => _CustomTextFormEditProfileState();
}

class _CustomTextFormEditProfileState extends State<CustomTextFormEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title.tr(),
          style:
              TextStyleManager.textStyle12w500.copyWith(color: Colors.grey),
        ),
        SpaceManager.sizedBox16h(context),
        CustomTextFormField(
          textHint: widget.textHint.tr(),
          prefixIcon: widget.iconData,
          validator: (value) {
            widget.validator(value!);
          },
          controller: widget.controller,
          obscureText: widget.obscureText,
          suffixIcon: widget.suffixIcon ,
          changePasswordVisibility: () {
            widget.changePasswordVisibility!();
          },
        ),
      ],
    );
  }
}
