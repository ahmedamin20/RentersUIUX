import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resource/assets_manager.dart';
import '../../../../../../core/resource/text_style_manager.dart';

class RecommendedItemDetailsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RecommendedItemDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:Padding(
        padding:  EdgeInsets.only(left: 16.w,top: 12.h,bottom: 12.h),
        child: Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black,width: 2.w),
          ),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.clear,
              size: 20,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.delete,width: 20.w,height: 20.h,),
              SizedBox(width: 12.w,),
              Text('1',style: TextStyleManager.textStyle16w500,),
            ],
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(44.h);
}
