import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../componants/a2z_custom_button.dart';

class DeleteCardBottomSheet extends StatelessWidget {
  const DeleteCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 375.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.h,),
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: (){
                    context.pop();
                  },
                  child: CircleAvatar(
                    radius: 13.w,
                    backgroundColor: const Color(0xff292D32),
                    child: CircleAvatar(
                      radius: 12.w,
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
                SizedBox(width: 16.w,)
              ],
            ),
            SizedBox(height: 16.h,),
            Image.asset(AssetsManager.deleteCard),
            SizedBox(height: 24.h,),
            Text(TextManager.deleteCard,style: TextStyleManager.textStyle20w600,),
            SizedBox(height: 16.w,),
            Text(TextManager.areYouSure,style: TextStyleManager.textStyle16w500.copyWith(fontWeight: FontWeight.w400),),
            SizedBox(height: 64.h,),
            Row(
              children: [
                 Expanded(child: A2zCustomButton(buttonName: TextManager.yesDelete, onPressed: (){},)),
                SizedBox(width: 1.w,),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(right: 16.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.r),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: const BorderSide(color: ColorsManager.colorText)
                          ),
                          backgroundColor: Colors.white),
      
                      onPressed: (){},
                      child: Text(TextManager.saveCard,
                          style: TextStyleManager.textStyle16w500),
                    ),
                  ),
                )
      
              ],
            )
          ],
        ),
      ),
    );
  }
}
