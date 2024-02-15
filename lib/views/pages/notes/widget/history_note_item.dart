import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import 'delete_note_dialog.dart';

class HistoryNoteItem extends StatelessWidget {
  const HistoryNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 23.w ),
      child: Container(
        width: 328.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: ColorsManager.border,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              )
            ]
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.3.h,),
              Padding(
                padding:  EdgeInsets.only(left: 5.w),
                child: Text('#!',style: TextStyleManager.textStyle20w500,),
              ),
              SizedBox(height: 5.h,),
              Text('created at  :14/2/2024',style: TextStyleManager.textStyle20w500,),
              Text('Total Price  : 140',style: TextStyleManager.textStyle20w500,),
              SizedBox(height: 9.h,),

            ],
          ),
        ),

      ),
    );
  }
}
