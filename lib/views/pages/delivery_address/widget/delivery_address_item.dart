import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../view_model/cubit/profile_cubit/profile_cubit.dart';

class DeliveryItem extends StatelessWidget {
  final String paymentName;
  final String ?description;
  final String image;
  final int index;


  const DeliveryItem({super.key, required this.paymentName,  this.description, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileState>(
      listener: (context,state){},
      builder: (context,state){
        return Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 24.w,bottom: 24.h),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child:  Image.asset(image),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            paymentName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleManager.textStyle16w500,
                          ),
                          description!=null ?  Text(
                            description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleManager.textStyle12w500.copyWith(fontWeight: FontWeight.w400).copyWith(
                                letterSpacing: 0.40.w,
                                height: 1.5.h,
                                color: ColorsManager.gray2),
                          ):const SizedBox(),
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
