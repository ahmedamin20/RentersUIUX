import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_colors.dart';

class AppButton extends StatelessWidget {
  AppButton({Key? key, required this.text, required this.onTap,this.iconData})
      : super(key: key);
  String text;
  VoidCallback onTap;
  IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(color: AppColors.white,
                    fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
                ),
                Icon(iconData,color: AppColors.white,)
              ],
            )),
      ),
    );
  }
}