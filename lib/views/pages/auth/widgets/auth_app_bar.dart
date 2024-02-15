import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    super.key,
    this.onPressed,
  });
  final Function ?onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: LayoutCubit.get(context).isDark
          ? ColorsManager.blackColor
          : ColorsManager.white,
      leading: IconButton(
        padding: EdgeInsets.zero,
        icon:  Icon(
          Icons.close,
          color: LayoutCubit.get(context).isDark
              ?        ColorsManager.white
              : ColorsManager.grayDark,

        ),
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          if(onPressed!=null)
            {
              onPressed!();
            }else
            {
              context.pop();

            }
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
