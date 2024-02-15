import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';

import '../../../../core/resource/text_style_manager.dart';
import '../../../../view_model/cubit/layout_cubit/layout_cubit.dart';

class LanguageItem extends StatelessWidget {
  final String text;
  final String flag;
  final int index;
  const LanguageItem({super.key, required this.text, required this.flag, required this.index});

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        BlocConsumer<ProfileCubit,ProfileState>(
          listener: (context,state){},
          builder: (context,state){
            return Padding(
              padding: EdgeInsets.only(left: 16.w,right: 0.w,bottom: 20+8+8.h,),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
//                   SizedBox(
//                       width: 32.w,
//                       child: Image.asset(flag,),
//
//
//                   ),
// =======
                 CircleAvatar(
                   backgroundImage: AssetImage(flag),
                 ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyleManager.textStyle16w500
                            .copyWith(color: LayoutCubit.get(context).isDark?Colors.white:ColorsManager.colorText),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ProfileCubit.get(context).currentIndex==index?  Padding(
                    padding:   EdgeInsets.only(right: 8.w),
                    child: Radio(
                      fillColor: const MaterialStatePropertyAll(ColorsManager.colorBlue,),
                      value:'',
                      groupValue:'',
                      onChanged: (value) {
                      },
                    ),
                  ):const SizedBox(),

                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
