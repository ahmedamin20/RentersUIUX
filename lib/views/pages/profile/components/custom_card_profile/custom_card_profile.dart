import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';

import '../../../../../core/resource/colors_manager.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../../../../view_model/cubit/layout_cubit/layout_cubit.dart';

class CustomCardProfile extends StatelessWidget {
  const CustomCardProfile({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
    this.color = ColorsManager.colorText,
    this.backGroundButton = ColorsManager.white,
    this.arrowColor = ColorsManager.grayDark,
    this.textColor = ColorsManager.grayDark,  this.description,  this.isArrow=true,
    this.colorIcon = ColorsManager.colorIcon,

  });
  final String iconData;
  final String title;
  final String? description;
  final Function onTap;
  final Color color ;
  final Color backGroundButton;
  final textColor ;
  final Color arrowColor ;
  final bool isArrow;
  final Color colorIcon ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child:  BlocConsumer<LayoutCubit,LayoutState>(
        listener: (context,state){},
        builder: (context,state){
          return Padding(
            padding:EdgeInsets.only(left: 16.w,right: 24.w,bottom: 24+8.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(iconData,width: 24.w,height: 24.h,fit: BoxFit.fill,color: ColorsManager.colorText,),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyleManager.textStyle16w500
                          .copyWith(color: LayoutCubit.get(context).isDark?Colors.white:color

                      ),
                    ),
                    description!=null?Text(description!,style: TextStyleManager.textStyle12w500.copyWith(fontSize: 12.sp,
                        color: ColorsManager.gray2
                    ),):
                    const SizedBox(),
                  ],
                ),
                const Spacer(),
                isArrow?  Icon(Icons.arrow_forward_ios_rounded,
                    color: arrowColor, size: 16.sp):const SizedBox(),
              ],
            ),
          );
        },

      ),
    );
  }
}
