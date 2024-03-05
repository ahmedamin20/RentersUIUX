import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';

import '../../../core/resource/colors_manager.dart';
class CustomLogoWidget extends StatelessWidget {
  const CustomLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.all( 50.h),
            width: 300.w,
            height: 300.h,
        
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorsManager.white.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(0, 100), // changes position of shadow
              ),
              BoxShadow(
                color: ColorsManager.white.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(50, 2), // changes position of shadow
              ),
               BoxShadow(
                color: ColorsManager.white.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(-50, 2), // changes position of shadow
              ),
               BoxShadow(
                color: ColorsManager.white.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(2, 50), // changes position of shadow
              ),
                BoxShadow(
                color: ColorsManager.white.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(2, -50), // changes position of shadow
              ),
              BoxShadow(
                color: ColorsManager.white.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            )
          ),
        ),
        Center(
          child: Container(
            width: 400.w,
            height: 400.h,
            decoration: const BoxDecoration(
            
              image: DecorationImage(
                image: AssetImage(AssetsManager.logoImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}