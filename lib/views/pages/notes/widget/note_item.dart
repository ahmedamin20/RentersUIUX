import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import 'delete_note_dialog.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

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
        child: Column(
          children: [
            SizedBox(height: 8.h,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                Text('name of items',style: TextStyleManager.textStyle20w500,),
                const Spacer(),
                InkWell(
                    onTap: (){
                      showDialog(
                          context: context, builder: (context){
                        return  Dialog(
                          child: DeleteNoteDialogWidget(onPressedYes: () { },)
                        );
                      });
                    },
                    child: Image.asset(AssetsManager.deleteNote,width: 30.w,height: 30.h,)),
                SizedBox(width: 14.w,),
              ],
            ),
            SizedBox(height: 9.h,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                Text('price Range 10 : 15',style: TextStyleManager.textStyle20w500,),
                const Spacer(),
                Image.asset(AssetsManager.editNote,width: 30.w,height: 35.h,),
                SizedBox(width: 14.w,),
              ],
            ),
            SizedBox(height: 7.h,),

          ],
        ),

      ),
    );
  }
}
