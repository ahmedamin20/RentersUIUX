import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/views/pages/auth/widgets/new_password/custom_text_validation.dart';

class ValidationPassword extends StatelessWidget {
  const ValidationPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextValidation(
          text: TextManager.notContainEmailOrPasswordChech,
          color: ColorsManager.green,
        ),
        SpaceManager.sizedBox8h(context),
        const CustomTextValidation(
          text: TextManager.lenCheck,
        ),
        SpaceManager.sizedBox8h(context),
        const CustomTextValidation(
          text: TextManager.containSymbolOrNum,
        ),
      ],
    );
  }
}
