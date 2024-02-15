import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/text_style_manager.dart';
import '../../../view_model/cubit/layout_cubit/layout_cubit.dart';
class AppBarCustom extends StatelessWidget  implements PreferredSizeWidget
{
  final String title;
  const AppBarCustom({Key? key,required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.h),
      child: Container(
        decoration: BoxDecoration(
          color: LayoutCubit.get(context).isDark ? ColorsManager.grayDark:ColorsManager.primaryColor ,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.r),
            bottomRight: Radius.circular(40.r),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.r),
            bottomRight: Radius.circular(40.r),                  ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              left: 20.w,
              right: 20.w,
            ),
            child: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
              backgroundColor:  LayoutCubit.get(context).isDark ? ColorsManager.grayDark:ColorsManager.primaryColor ,
            elevation: 0,
              title: Text(
                title,
                style: TextStyleManager.textStyle16w700.copyWith(color: Colors.white),
              ),
              centerTitle: true,
              actions:
              [

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80.h);
}
