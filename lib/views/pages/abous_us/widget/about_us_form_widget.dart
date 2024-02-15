import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';

import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../view_model/cubit/about_us_cubit/about_us_cubit.dart';


class AboutUsFormWidget extends StatelessWidget {
 final  AboutUsCubit aboutUsCubit;
  const AboutUsFormWidget({super.key, required this.aboutUsCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 1.h,
          color: ColorsManager.gray2,
        ),
        SizedBox(
          height: 24.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(25.r),
              color: ColorsManager.gray2,
              image: DecorationImage(
                image: NetworkImage(
                    aboutUsCubit
                    .aboutUsModel!.data!.image!),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Text(
          aboutUsCubit.aboutUsModel!.data!.name!,
          style: TextStyleManager.textStyle20w500,
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          aboutUsCubit.aboutUsModel!.data!.description!,
          style: TextStyleManager.textStyle16w400
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(TextManager.vission,
            style: TextStyleManager.textStyle20w500,),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
