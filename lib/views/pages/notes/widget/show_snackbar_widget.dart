import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../componants/custom_elevated_button.dart';

class ShowSnackBarWidget extends StatelessWidget {
  final String text;
  const ShowSnackBarWidget({super.key,  this.text=TextManager.confirm});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final scaffold = ScaffoldMessenger.of(context);
          scaffold.showSnackBar(
            SnackBar(
              backgroundColor: ColorsManager.colorXPrimary,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.only(topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r)),
              ),
              content:Container(
                width: 375.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r))),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(TextManager.totalRange,style: TextStyleManager.textStyle20w500.copyWith(color: Colors.white),),
                        SizedBox(height: 1.h,),
                        Padding(
                          padding:  EdgeInsets.only(left: 21.w),
                          child:  Text('100 :200',style: TextStyleManager.textStyle20w500.copyWith(color: Colors.white),),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                      text: text,
                      onPressed: (){},
                      width: 106,
                      color: Colors.white,
                      textColor: const Color(0XFFFF0303),

                    )
                  ],
                ),
              ),

              duration: const Duration(seconds: 5),
            ),
          );
        },
        child: const Text('Show Snackbar'),
      ),
    );
  }
}
