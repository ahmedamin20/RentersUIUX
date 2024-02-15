
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({
    super.key,
    required this.onCompleted,
  });
  final Function onCompleted;

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
        length: 4,
        otpFieldStyle: OtpFieldStyle(
            backgroundColor: ColorsManager.textFormFieldColor,
        ),
        fieldStyle: FieldStyle.box,
        fieldWidth: 36.w,
        outlineBorderRadius: 15.r,
        width: MediaQuery.of(context).size.width,
        style: TextStyleManager.textStyle12w500,
        // controller: VerifyCubit.get(context).OTPController,
        onChanged: (pin) {
          print("Changed: $pin");
        },
        onCompleted: (pin)
        {
          onCompleted(pin);
          print("Completed: $pin");
        });
  }
}
