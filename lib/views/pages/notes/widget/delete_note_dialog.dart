import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';

import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../view_model/cubit/profile_cubit/profile_cubit.dart';
import '../../../componants/custom_elevated_button.dart';

class DeleteNoteDialogWidget extends StatelessWidget {
  final String text;
  final Function() onPressedYes;
  const DeleteNoteDialogWidget({super.key,  this.text=TextManager.areYouSureDeleteNote, required this.onPressedYes});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 328.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 56.h,),
            Padding(
              padding:  EdgeInsets.only(left: 6.w,right: 7.w),
              child: Text(text,style: TextStyleManager.textStyle16w500.copyWith(fontWeight: FontWeight.w400,color: Colors.black),),
            ),
            SizedBox(height: 29.h,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                Expanded(
                  child: CustomElevatedButton(
                    text: TextManager.no,
                    onPressed: (){
                      context.pop();
                    },
                    width:   120,
                    color:ColorsManager.lightGreen2,
                  ),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: CustomElevatedButton(
                    text: TextManager.yes,
                    onPressed: onPressedYes,
                    width:   120,
                    color:ColorsManager.colorRed,
                  ),
                ),
                SizedBox(width: 15.w,),
      
              ],
            ),
            SizedBox(height: 14.h,)
      
          ],
        ),
      ),
    );
  }
}
