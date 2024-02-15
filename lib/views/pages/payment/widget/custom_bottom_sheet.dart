import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../componants/a2z_custom_button.dart';
import '../../../componants/custom_text_form_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        width: 375.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
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
                SizedBox(width: 16.w,),
              ],
            ),
            SizedBox(height: 8.h,),
            Text(TextManager.addNewCard,style: TextStyleManager.textStyle20w600,),
            SizedBox(height: 32.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TextManager.cardNumber,style: TextStyleManager.textStyle12w500.copyWith(fontWeight: FontWeight.w400),),
                  SizedBox(height: 8.h,),
                  const CustomTextFormField(textHint: '00000 0000 00000 0000',isPrefix: false,obscureText: true,obscuringCharacter: 'X',),
                  SizedBox(height: 24.h,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(TextManager.expiredDate,style: TextStyleManager.textStyle12w500.copyWith(fontWeight: FontWeight.w400),),
                            SizedBox(height: 8.h,),
                            const CustomTextFormField(textHint: 'MM/YY',isPrefix: false,),
                          ],
                        ),
                      ),
                      SizedBox(width: 17.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(TextManager.cvv,style: TextStyleManager.textStyle12w500.copyWith(fontWeight: FontWeight.w400),),
                            SizedBox(height: 8.h,),
                            const CustomTextFormField(textHint: '123',isPrefix: false,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h,),
             A2zCustomButton(buttonName: TextManager.saveCard, onPressed: (){},),
            SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }
}
