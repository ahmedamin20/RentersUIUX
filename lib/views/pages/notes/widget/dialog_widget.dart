import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/views/pages/notes/widget/slider_widget.dart';

import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../componants/a2z_custom_button.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 322.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(44.r),color: Colors.white),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 22.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 40.w),
                  child: Text(TextManager.request,style: TextStyleManager.textStyle20w500,),
                ),
                SizedBox(height: 12.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 33.w,right: 34.w),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        contentPadding: const EdgeInsets.all(13)
                    ),

                  ),
                ),
                SizedBox(height: 7.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 35.w),
                  child: Text(TextManager.priceRange,style: TextStyleManager.textStyle18w700.copyWith(fontWeight: FontWeight.w600),),
                ),
                SizedBox(height: 8.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 40.w),
                  child: SliderWidget(),
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 40.w,right: 38.w,bottom: 28.h),
                  child:  A2zCustomButton(buttonName: TextManager.done,onPressed: (){
                  },),
                )
              ],
            ),
          ],
        ),

      ),
    );
  }
}
