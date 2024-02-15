import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/resource/text_manager.dart';
import '../../core/services/app_router.dart';
import 'custom_elevated_button.dart';

class A2zCustomButton extends StatelessWidget {
  final String buttonName;
  final Function()? onPressed;

  const A2zCustomButton({super.key, required this.buttonName,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 16.w,right: 16.w),
      child: CustomElevatedButton(text: buttonName, onPressed: onPressed!,
        ),
    );
  }
}
